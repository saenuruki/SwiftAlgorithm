class Solution {
    func romanToInt(_ s: String) -> Int {
        
        let symbols = Array(s).compactMap({ Symbol(rawValue: $0) })
        var pointer = symbols.count - 1
        var output = 0
        while pointer >= 0 {
            let symbol = symbols[pointer]
            if pointer > 0, symbols[pointer - 1].isDecrement(with: symbol) {
                output += symbol.num - symbols[pointer - 1].num
                pointer -= 2
            } else {
                output += symbol.num
                pointer -= 1
            }
        }
        return output
    }
}

enum Symbol: Character {
    case i = "I"
    case v = "V"
    case x = "X"
    case l = "L"
    case c = "C"
    case d = "D"
    case m = "M"
    
    var num: Int {
        switch self {
        case .i: return 1
        case .v: return 5
        case .x: return 10
        case .l: return 50
        case .c: return 100
        case .d: return 500
        case .m: return 1000
        }
    }
    
    func isDecrement(with parent: Symbol) -> Bool {
        switch self {
        case .i: return parent == .v || parent == .x
        case .x: return parent == .l || parent == .c
        case .c: return parent == .d || parent == .m
        default: return false
        }
    }
}
