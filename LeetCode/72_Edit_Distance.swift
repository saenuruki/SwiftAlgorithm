class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        guard m > 0 && n > 0 else { return abs(m - n) } 
        let word1Array = Array(word1)
        let word2Array = Array(word2)

        var dp = Array(repeating: Array(repeating: m * n, count: n + 1), count: m + 1)

        for row in 0...m {
            dp[row][0] = row
        }
        for col in 0...n {
            dp[0][col] = col
        }
        for row in 1...m {
            for col in 1...n {
                if word1Array[row - 1] == word2Array[col - 1] {
                    // no operation
                    dp[row][col] = dp[row - 1][col - 1]
                } else {
                    let replace = dp[row - 1][col - 1] // replace operation
                    let insert = dp[row - 1][col] // insert operation
                    let remove = dp[row][col - 1] // remove operation
                    dp[row][col] = min(replace, insert, remove) + 1
                }
            }
        }
        return dp.last!.last!
    }
}
