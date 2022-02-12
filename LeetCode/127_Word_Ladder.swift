class Solution {
    var cache = [String: [String: Bool]]() // space: O(N^2)

    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set(wordList) // space: O(N)
        wordSet.remove(beginWord)
        guard wordSet.contains(endWord) else { return 0 }
        if isLadderWord(beginWord, endWord) { return 2 }
        
        var queue: [(String, Int)] = [(beginWord, 1)] // space: O(N)
        
        // time: O(N)
        while !queue.isEmpty {
            let firstItem = queue.first!
            queue.remove(at: 0) // time: O(N)
            wordSet.remove(firstItem.0) // time: O(1)
            updateCache(firstItem.0, wordSet) // time: O(N)
            
            let neighborWordSet = wordSet.filter { isLadderWord(firstItem.0, $0) }
            let neighborWordList = neighborWordSet.map { word in (word, firstItem.1 + 1) }
            queue += neighborWordList
            wordSet = wordSet.subtracting(neighborWordSet)
            if isLadderWord(firstItem.0, endWord) { return firstItem.1 + 1 }

        }
        return 0
    }
    
    func updateCache(_ beginWord: String, _ wordSet: Set<String>) {
        var targetCaches = [String: Bool]()
        if let beginWordCaches = cache[beginWord] { targetCaches = beginWordCaches }
        
        // time: O(N)
        wordSet.forEach { word in
            if targetCaches[word] == nil && cache[word]?[beginWord] == nil {
                targetCaches[word] = isLadderWord(beginWord, word) // time: O(K)
            }
        }
        cache[beginWord] = targetCaches
    }
    
    func isLadderWord(_ beginWord: String, _ endWord: String) -> Bool {
        guard cache[beginWord]?[endWord] == nil && cache[endWord]?[beginWord] == nil else {
            return cache[beginWord]?[endWord] ?? cache[endWord]?[beginWord] ?? false
        }
        var notMatchCount = 0
        let beginChars = Array(beginWord)
        let endChars = Array(endWord)
        // time: O(K)
        for i in 0..<beginChars.count {
            if beginChars[i] != endChars[i] { notMatchCount += 1 }
            if notMatchCount >= 2 { return false }
        }
        return notMatchCount == 1
    }
}
