class Solution {
    func greatestLetter(_ s: String) -> String {
        var map = [String: (Bool, Bool)]()
        for char in s {
            var (lower, upper) = map[String(char.uppercased())] ?? (false, false)
            map[String(char.uppercased())] = char.isUppercase ?  (lower, true) : (true, upper)
        }
        return map.compactMap({ $0.value.0 && $0.value.1 ? $0.key : nil }).max() ?? ""
    }
}
