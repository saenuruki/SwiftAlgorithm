class Solution {
    
    let diffX = [1,-1,0,0]
    let diffY = [0,0,1,-1]
    var rowMax = 0
    var colMax = 0
    var inputMatrix = [[Int]]()
    var cache = [[Int]]()

    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {

        rowMax = matrix.count
        colMax = matrix.first!.count
        inputMatrix = matrix
        cache = [[Int]](repeating: [Int](repeating: 0, count: colMax), count: rowMax)
        
        var output = 0
        
        for i in 0..<rowMax {
            for j in 0..<colMax {
                output = max(output, findLongestPath(i, j))
            }
        }
        return output
    }
    
    func findLongestPath(_ row: Int, _ col: Int) -> Int {
        guard cache[row][col] == 0 else { return cache[row][col] } 
        var output = 0
        // right, left, top, bottom
        for i in 0..<4 {
            let nextRow = row + diffY[i]
            let nextCol = col + diffX[i]
            guard isAccessible(nextRow, nextCol) else { continue }
            guard inputMatrix[row][col] < inputMatrix[nextRow][nextCol] else { continue }
            output = max(output, findLongestPath(nextRow, nextCol))
        }
        cache[row][col] = output + 1
        return cache[row][col]
    }
    
    func isAccessible(_ row: Int, _ col: Int) -> Bool {
        return row >= 0 && row < rowMax && col >= 0 && col < colMax
    }
}
