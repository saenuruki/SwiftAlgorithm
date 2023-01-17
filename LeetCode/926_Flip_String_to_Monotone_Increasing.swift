class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let sArray = Array(s).map({ $0 == "1" })
        let sCount = s.count
        var dp = Array(repeating: 0, count: sCount + 1)
        for i in 0..<sCount {
            dp[i + 1] = dp[i] + (sArray[i] ? 1 : 0)
        }

        var minFlips = Int.max
        for i in 0..<dp.count {
            let flipCount = dp[i] + (sCount - i) - (dp.last! - dp[i])
            minFlips = min(minFlips, flipCount)
        }
        return minFlips
    }
}
