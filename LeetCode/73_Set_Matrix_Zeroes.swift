class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {        
        // 1. find 0 index
        var rowSet = Set<Int>()
        var colSet = Set<Int>()
        for i in 0..<matrix.count {
            for j in 0..<matrix.first!.count {
                if matrix[i][j] == 0 { 
                    rowSet.insert(i)
                    colSet.insert(j)
                }
            }
        }

        // 2. replace all rows and columns to 0
        var output = matrix
        for i in 0..<matrix.count {
            for j in 0..<matrix.first!.count {
                if rowSet.contains(i) || colSet.contains(j) {
                    output[i][j] = 0
                }
            }
        }

        matrix = output
    }
}
