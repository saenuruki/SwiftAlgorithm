class Solution {
    func decodeMessage(_ key: String, _ message: String) -> String {
        
        // 1. make decoding format
        var decodignMap = [Character: String]()
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz").map { String($0) }
        var pointer = 0
        for char in key where pointer < alphabet.count {
            if char == " " { continue }
            if decodignMap[char] == nil {
                decodignMap[char] = alphabet[pointer]
                pointer += 1
            }
        }

        // 2. decode a messag
        var output = ""
        for char in message {
            if let decodingStr = decodignMap[char] {
                output += decodingStr
            } else {
                output += String(char)
            }
        }
        return output
    }
}
