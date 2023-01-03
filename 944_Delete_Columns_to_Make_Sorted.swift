class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let charMatrix: [[Character]] = strs.map({ Array($0) })
        var scanArray: [Character] = charMatrix.first!
        for i in 0..<charMatrix.count {
            for j in 0..<charMatrix.first!.count where scanArray[j] != "1" {
                if scanArray[j] <= charMatrix[i][j] {
                    scanArray[j] = charMatrix[i][j]
                } else {
                    scanArray[j] = "1"
                }
            }
        }
        return scanArray.filter({ $0 == "1" }).count
    }
}
