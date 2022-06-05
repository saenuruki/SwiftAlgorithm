// Time: O(R*C)
// Space: O(R*C)
class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        
        let currentRowCount = matrix.count
        let currentColCount = matrix.first!.count
        var output = Array(repeating: Array(repeating: 0, count: currentRowCount), count: currentColCount)
        
        for row in 0..<currentRowCount {
            for col in 0..<currentColCount {
                output[col][row] = matrix[row][col]
            }
        }
    
        return output
    }
}
