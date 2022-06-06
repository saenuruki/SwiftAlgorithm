class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        let lowerS = s.lowercased()
        let filteredS = lowerS.filter({ isTargetValue($0) })
       
        return filteredS == String(filteredS.reversed())
    }
    
    func isTargetValue(_ char: Character) -> Bool {
        let isAlphabet = char.ascii >= Character.a.ascii && char.ascii <= Character.z.ascii
        let isNumber = char.ascii >= Character.zero.ascii && char.ascii <= Character.nine.ascii
        return isAlphabet || isNumber
    }
}

extension Character {
    static let a = Character("a")
    static let z = Character("z")
    static let zero = Character("0")
    static let nine = Character("9")
    var ascii: Int {
        return Int(unicodeScalars.first!.value)   
    }
}

