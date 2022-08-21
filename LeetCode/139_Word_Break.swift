class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        let wordSet = Set(wordDict)
        let sArray = Array(s)
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1...s.count {
            for j in 0..<i {
                let word = String(Array(sArray[j..<i]))
                if dp[j] && wordSet.contains(word) {
                    dp[i] = true
                }
            }
        }
        return dp.last!
    }
}


