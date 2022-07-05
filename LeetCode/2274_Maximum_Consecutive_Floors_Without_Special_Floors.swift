class Solution {
    func maxConsecutive(_ bottom: Int, _ top: Int, _ special: [Int]) -> Int {
        guard top - bottom + 1 > special.count else { return 0 }
        let sortedSpecial = Set(special).sorted()
        var output = max(sortedSpecial.first! - bottom, top - sortedSpecial.last!)        
        for i in 1..<sortedSpecial.count {
            output = max(output, sortedSpecial[i] - sortedSpecial[i - 1] - 1)
        }
        return output
    }
}
