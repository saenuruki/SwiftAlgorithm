class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count >= 2 else { return true }

        // 1. Make Order table
        var orderTable = [Character: Int]()
        for (i, char) in order.enumerated() {
            orderTable[char] = i
        }

        // 2. Verify the order of words
        for i in 1..<words.count {
            var pointer = 0
            let word1 = Array(words[i - 1])
            let word2 = Array(words[i])
            while pointer < word1.count && pointer < word2.count {
                let order1 = orderTable[word1[pointer]] ?? -1
                let order2 = orderTable[word2[pointer]] ?? -1
                if order1 < order2 {
                    break
                } else if order1 == order2 {
                    pointer += 1
                } else {
                    return false
                }
            }
            if pointer == word2.count && word1.count > word2.count { return false }
        }

        return true
    }
}
