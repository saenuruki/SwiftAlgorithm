class Solution {
    
    var dp = [Int: Int]() // key: num, value: count
    
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        if let cachedNum = dp[n] { return cachedNum }        
        dp[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return dp[n] ?? 0
    }
}
