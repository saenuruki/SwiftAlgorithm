class Solution {
    func partitionString(_ s: String) -> Int {
        
        var cacheCharSet = Set<Character>()
        var output = 0
        for char in s {
            if cacheCharSet.contains(char) {
                output += 1
                cacheCharSet = [char]
            } else {
                cacheCharSet.insert(char)
            }
        }
        if !cacheCharSet.isEmpty { output += 1 }
        return output
    }
}
