class Solution {
    func maxProduct(_ words: [String]) -> Int {
        guard words.count > 1 else { return 0 }
        let wordSet: [Set<Character>] = words.map({ Set(Array($0)) })
        var output = 0
        for i in 1..<words.count {
            for j in 0..<i {
                guard words[i].count * words[j].count > output else { continue }
                if !haveDuplicate(words[i], wordSet[j]) {
                    output = max(output, words[i].count * words[j].count)
                }
            }
        }
        return output
    }
    
    func haveDuplicate(_ str: String, _ wordSet: Set<Character>) -> Bool {
        for char in str {
            if wordSet.contains(char) { return true }
        }
        return false
    }
}
