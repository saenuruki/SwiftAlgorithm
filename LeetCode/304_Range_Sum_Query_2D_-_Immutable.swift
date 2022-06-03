class NumMatrix {
    
    var dp = [[Int]]()

    init(_ matrix: [[Int]]) {
        dp = matrix
        
        for row in 0..<matrix.count {
            for col in 0..<matrix[row].count {
                let previousSum = col >= 1 ? dp[row][col - 1] : 0
                dp[row][col] = previousSum + matrix[row][col]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        
        var output = 0
        for row in row1...row2 {
            if col1 > 0 {
                output += dp[row][col2] - dp[row][col1 - 1]
            } else {
                output += dp[row][col2]
            }            
        }
        return output
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
