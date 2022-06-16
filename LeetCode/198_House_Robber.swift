// DP
// Time: O(N)
// Space: O(N)
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        guard nums.count > 1 else { return nums[0] }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = nums[1]
        for i in 2..<nums.count {
            dp[i] = max(dp[i - 2] + nums[i], i - 3 >= 0 ? dp[i - 3] + nums[i] : 0)
        }
        return max(dp[nums.count - 1], dp[nums.count - 2])
    }
}
