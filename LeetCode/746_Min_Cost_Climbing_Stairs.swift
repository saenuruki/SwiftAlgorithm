// Dynamic Programing
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count)
        dp[0] = cost[0]
        dp[1] = cost[1]
        for i in 2..<cost.count {
            dp[i] = min(dp[i - 2], dp[i - 1]) + cost[i]
        }
        let lastIndex = cost.count - 1
        return min(dp[lastIndex], dp[lastIndex - 1])
    }
}
