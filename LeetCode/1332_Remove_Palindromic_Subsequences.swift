class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        return s == String(s.reversed()) ? 1 : 2
    }
}

