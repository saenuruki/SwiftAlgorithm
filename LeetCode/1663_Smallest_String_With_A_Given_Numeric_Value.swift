// Time: O(1)
// Space: O(1)

class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        
        let remainCount = k - n
        let zCount = remainCount/25
        let zStrs = zCount > 0 ? String(repeating: "z", count: zCount) : ""
        let middleStr = zCount == n ? "" : "\(UnicodeScalar(Character("a").ascii + remainCount%25)!)"
        let aCount = n - zCount - 1
        let aStrs = aCount > 0 ? String(repeating: "a", count: aCount) : ""
        
        return aStrs + middleStr + zStrs
    }
}

extension Character {
    var ascii: Int {
        return Int(unicodeScalars.first!.value)
    }
}
