class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else { return [] }
        let sArray = Array(s)
        var dnaSet = Set<String>()
        var output = Set<String>()
        
        // Sliding Window
        for i in 0...sArray.count - 10 {
            let dna = String(Array(sArray[i..<i + 10]))
            if dnaSet.contains(dna) {
                output.insert(dna)
            }
            dnaSet.insert(dna)
            
        }
        
        return Array(output)
    }
}
