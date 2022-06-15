// Time: O(NlogN + NK^2)
// Space: O(N)
class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        guard words.count > 1 else { return words.count }
        
        // 1. sort
        let sortedWords = words.sorted(by: { $0.count < $1.count })
        
        // 2. Dynamic Programing
        var dp = [String: Int]() // key: the word, value: maximum count of String Chain
        for word in sortedWords {
            var longestChain = 1
        
            for index in 0..<word.count {
                var array = Array(word)
                array.remove(at: index)
                let score = dp[String(array)] ?? 0
                longestChain = max(longestChain, score + 1)
            }
            dp[word] = longestChain
        }
        return dp.map({ $0.value }).max() ?? 0
    }
}
