class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        
        var outputBoard = board
        
        for row in 0..<outputBoard.count {
            for col in 0..<outputBoard[row].count {
                outputBoard[row][col] = isNextLive(row, col, board) ? 1 : 0
            }
        }
        
        board = outputBoard
    }
    
    func isNextLive(_ row: Int, _ col: Int, _ board: [[Int]]) -> Bool {
        
        let myself = board[row][col]
        let topLeft = row > 0 && col > 0 ? board[row - 1][col - 1] : 0
        let top = row > 0 ? board[row - 1][col] : 0
        let topRight = row > 0 && col < (board.first!.count - 1) ? board[row - 1][col + 1] : 0
        let centerLeft = col > 0 ? board[row][col - 1] : 0
        let centerRight = col < (board.first!.count - 1) ? board[row][col + 1] : 0
        let bottomLeft = row < (board.count - 1) && col > 0 ? board[row + 1][col - 1] : 0
        let bottom = row < (board.count - 1) ? board[row + 1][col] : 0
        let bottomRight = row < (board.count - 1) && col < (board.first!.count - 1) ? board[row + 1][col + 1] : 0
        
        let liveNeighbors = [topLeft, top, topRight, centerLeft, centerRight, bottomLeft, bottom, bottomRight].reduce(0, +)
        if myself == 1 {
            return liveNeighbors == 2 || liveNeighbors == 3
        } else {
            return liveNeighbors == 3
        }
    }
}

