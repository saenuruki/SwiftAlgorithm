class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        
        let powK = Int(pow(2.0, Double(k)))
        guard s.count > k else { return false }
        var memo = Array(repeating: false, count: powK)
        for i in 0...(s.count - k) {
            let startIndex = s.index(s.startIndex, offsetBy: i)
            let endIndex = s.index(s.startIndex, offsetBy: i + k)
            let subS = String(s[startIndex..<endIndex])
            let binaryNum = Int(subS, radix: 2) ?? 0
            if binaryNum >= 0 && binaryNum < memo.count {
                memo[binaryNum] = true
            }
        }
        return memo.filter({ !$0 }).isEmpty
    }
}
