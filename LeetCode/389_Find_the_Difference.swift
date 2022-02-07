class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let arrayS = Array(s.sorted()) // O(NlogN + N)
        let arrayT = Array(t.sorted()) // O(NlogN + N)
        
        for i in 0..<arrayS.count { // O(N)
            if arrayS[i] != arrayT[i] { return arrayT[i] }
        }
        
        return arrayT.last!
    }
}
