class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        var hPointer = 0
        
        while hPointer < haystackArray.count - needleArray.count + 1 {
            var nPointer = 0
            while haystackArray[hPointer + nPointer] == needleArray[nPointer] {
                if nPointer == needleArray.count - 1 { return hPointer }
                guard hPointer + nPointer + 1 < haystackArray.count else { break }
                guard nPointer + 1 < needleArray.count else { break }
                nPointer += 1
            }
            hPointer += 1
        }
        return -1
    }
}
