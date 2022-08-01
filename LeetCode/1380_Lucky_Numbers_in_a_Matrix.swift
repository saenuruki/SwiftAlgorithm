class Solution {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        let minRows = matrix.map({ $0.min() ?? 0 })
        var maxCols = Array(repeating: 0, count: matrix.first!.count)
        for row in matrix {
            for i in 0..<row.count {
                maxCols[i] = max(maxCols[i], row[i])
            }
        }
        
        var output = Set<Int>()
        for row in 0..<matrix.count {
            for col in 0..<matrix.first!.count {
                if minRows[row] == maxCols[col] { output.insert(maxCols[col]) }
            }
        }
        return Array(output)
    }
}
