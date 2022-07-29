class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        let transformedPattern = transformIndex(pattern)
        return words.filter({ transformedPattern == transformIndex($0) })
    }
    
    func transformIndex(_ word: String) -> String {
        var map = [Character: String]()
        var index = 0
        var output = ""
        for char in word {
            if map[char] == nil {
                map[char] = "\(index)"
                index += 1
            }
            output += map[char]!
        }
        return output
    }
}
