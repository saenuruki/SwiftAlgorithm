class Solution {
    let phoneKeyboards: [String: [String]] = ["2": ["a", "b", "c"],
                                             "3": ["d", "e", "f"],
                                             "4": ["g", "h", "i"],
                                             "5": ["j", "k", "l"],
                                             "6": ["m", "n", "o"],
                                             "7": ["p", "q", "r", "s"],
                                             "8": ["t", "u", "v"],
                                             "9": ["w", "x", "y", "z"],]
    func letterCombinations(_ digits: String) -> [String] {
        guard digits != "" else { return [] }
        let digitArray: [String] = Array(digits).map { String($0) } // time: O(N)
        
        return _letterCombinations(with: digitArray, index: 0, text: "") // time: O(treeLevel * 3 or 4)
    }
    
    func _letterCombinations(with digits: [String], index: Int, text: String) -> [String] {
        guard index < digits.count else { return [text] }
        
        var outputs: [String] = []
        if let characters = phoneKeyboards[digits[index]] {
            outputs = characters.flatMap { character in // time: O(characters.count) -> O(N)
                _letterCombinations(with: digits, index: index + 1, text: text + character) 
            }
        }
        return outputs
    }
}
