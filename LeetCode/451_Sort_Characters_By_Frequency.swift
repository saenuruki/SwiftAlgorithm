class Solution {
    func frequencySort(_ s: String) -> String {
        
        var cacheDB = [Character: Int]()
        for char in s {
            cacheDB[char, default: 0] += 1
        }
        
        let sortedChars = cacheDB.sorted(by: { $0.value > $1.value }).map({ $0.key })
        
        var output = ""
        for char in sortedChars {
            let str = String(char)
            output += String(repeating: str, count: cacheDB[char] ?? 0)
        }
        
        return output
    }
}

