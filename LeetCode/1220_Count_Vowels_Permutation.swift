class Solution {
    func countVowelPermutation(_ n: Int) -> Int {
        
        var map = [Vowel: Int]()
        for vowel in Vowel.allCases {
            map[vowel] = 1
        }
        
        var count = 1
        while count < n {
            var newMap = [Vowel: Int]()
            for vowel in Vowel.allCases {
                newMap[vowel] = (vowel.prev.map({ (map[$0] ?? 0) % 1000000007 }).reduce(0, +)) % 1000000007
            }
            map = newMap
            count += 1
        }
        return map.values.reduce(0, +) % 1000000007
    }
}

enum Vowel: CaseIterable {
    case a, e, i, o, u

    var prev: [Vowel] {
        switch self {
        case .a: return [.e, .i, .u]
        case .e: return [.a, .i]
        case .i: return [.e, .o]
        case .o: return [.i]
        case .u: return [.i, .o]
        }
    }
}
