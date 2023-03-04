class Solution {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ")
            .reversed()
            .reduce("") { $0.isEmpty ? String($1) : $0 + " " + $1 }
    }
}
