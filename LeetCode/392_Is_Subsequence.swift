class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else { return false }
        if s.count == 0 { return true }
        
        let arrayS = Array(s)
        var pointer = 0
        for char in t {
            if arrayS[pointer] == char {
                pointer += 1 
                if pointer >= arrayS.count { return true }
            }
        }
        return false
    }
}
