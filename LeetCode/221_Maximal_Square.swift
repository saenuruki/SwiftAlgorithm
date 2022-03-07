// Time: O(MN)
// Space: O(MN)

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        
        var output = 0
        var fixedMatrix: [[Int]] = matrix.map({ $0.map({ Int(String($0))! }) })
        
        // time: O(M) 
        for row in 0..<matrix.count {
            // time: O(N) 
            for col in 0..<matrix[row].count {
                
                guard row >= 1 && col >= 1 else {
                    output = max(output, fixedMatrix[row][col])
                    continue
                }
                
                let topLeftCell = fixedMatrix[row-1][col-1]
                let topCell = fixedMatrix[row-1][col]
                let leftCell = fixedMatrix[row][col-1]
                let thisCell = fixedMatrix[row][col]
                
                if thisCell > 0 && topLeftCell > 0 && topCell > 0 && leftCell > 0 {
                    // time: O(3) 
                    let minValue = [topLeftCell, topCell, leftCell].min()!
                    fixedMatrix[row][col] = minValue + 1
                    output = max(output, minValue + 1)
                } else if thisCell > 0 {
                    output = max(output, thisCell)
                }
            }
        }
        return output * output
    }
}
