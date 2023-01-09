class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        var wordDicts = [Character: String]()
        let words: [String] = s.split(separator: " ").map({ String($0) })
        let patterns = Array(pattern)

        guard words.count == patterns.count else { return false }
        for i in 0..<patterns.count {
            if let cachedWord = wordDicts[patterns[i]] {
                if cachedWord != words[i] { return false }
            } else {
                wordDicts[patterns[i]] = words[i]
            }
        }
        return Set(wordDicts.values).count == wordDicts.values.count
    }
}
