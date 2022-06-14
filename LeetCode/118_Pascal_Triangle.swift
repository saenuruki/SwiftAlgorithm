class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }
        var output: [[Int]] = [[1]]
        guard numRows > 1 else { return output }
        
        for i in 1..<numRows {
            var row = [Int]()
            let lastRow = output.last!
            for j in 0...i {
                if j == 0 || j == i {
                    row.append(1)
                } else {
                    row.append(lastRow[j - 1] + lastRow[j])
                }
            }
            output.append(row)
        }
        
        return output
    }
}
