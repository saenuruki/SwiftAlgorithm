class Solution {
    func countAndSay(_ n: Int) -> String {
        
        var dp = Array(repeating: "", count: n)
        dp[0] = "1"
        for i in 1..<n {
            let target = Array(dp[i - 1])
            var count = 1
            var output = ""
            for j in 0..<target.count {
                if (j + 1) < target.count, target[j] == target[j + 1] {
                    count += 1
                } else {
                    output += "\(count)\(target[j])"
                    count = 1
                }
            }
            dp[i] = output
        }
        return dp.last!
    }
}
