class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        
        // Sliding window
        let words = Array(s)
        var fastPointer = 0
        var slowPointer = 0
        var output = 0
        var subStringWordSet = Set<Character>()
        
        while fastPointer < words.count {
            let word = words[fastPointer]
            if subStringWordSet.contains(word) {
                while subStringWordSet.contains(word) {
                    guard slowPointer < words.count else { break }
                    subStringWordSet.remove(words[slowPointer])
                    slowPointer += 1   
                }
            }
            subStringWordSet.insert(word)
            let wordCount = subStringWordSet.count
            output = max(output, wordCount)
            fastPointer += 1
        }
        
        return output
    }
}
