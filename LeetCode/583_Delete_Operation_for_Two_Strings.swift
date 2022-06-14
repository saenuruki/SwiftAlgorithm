class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        var memo = Array(repeating: Array(repeating: 0, count: word2.count), count: word1.count)
        for row in 0..<word1.count {
            for col in 0..<word2.count {
                let topCell = row > 0 ? memo[row - 1][col] : 0
                let leftCell = col > 0 ? memo[row][col - 1] : 0
                let topLeftCell = row > 0 && col > 0 ? memo[row - 1][col - 1] : 0
                let prevValue = max(topCell, leftCell)
                memo[row][col] = word1Array[row] == word2Array[col] ? topLeftCell + 1 : prevValue
            }
        }
        let lastMemo = memo.last!.last!
        return (word1.count - lastMemo) + (word2.count - lastMemo)
    }
}
