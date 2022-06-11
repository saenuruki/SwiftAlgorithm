class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var dp = Array(repeating: Int.max, count: nums.count)
        dp[0] = 0 // initial point
        for i in 0..<nums.count {
            for j in 0...nums[i] {
                guard i + j < dp.count else { continue }
                dp[i + j] = min(dp[i + j], dp[i] + 1)
            }
        }
        return dp.last!
    }
}

