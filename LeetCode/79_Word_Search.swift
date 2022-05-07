class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        let rowMax = board.count
        let colMax = board.first!.count
        let wordArray = Array(word)
        let diffX = [1,-1,0,0]
        let diffY = [0,0,1,-1]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: colMax), count: rowMax)
        
        func findWordInMatrix(_ row: Int, _ col: Int, _ index: Int) -> Bool {
            guard index < wordArray.count else { return true }
            visited[row][col] = true
            for i in 0..<4 {
                let nextRow = row + diffY[i]
                let nextCol = col + diffX[i]
                guard isValidPosition(nextRow, nextCol) else { continue }
                guard !visited[nextRow][nextCol] else { continue }
                guard board[nextRow][nextCol] == wordArray[index] else { continue }
                if findWordInMatrix(nextRow, nextCol, index + 1) { return true } 
            }
            visited[row][col] = false
            return false 
        }
        
        func isValidPosition(_ row: Int, _ col: Int) -> Bool {
            return row >= 0 && row < rowMax && col >= 0 && col < colMax
        }
        
        for i in 0..<rowMax {
            for j in 0..<colMax {
                // start position
                if board[i][j] == wordArray.first! {
                    // start traversal
                    if findWordInMatrix(i, j, 1) { return true }
                }
            }
        }
        return false
    }
}
