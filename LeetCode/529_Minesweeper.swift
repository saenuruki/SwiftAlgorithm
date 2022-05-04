class Solution {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {

        var output = board
        guard board[click[0]][click[1]] != "M" else { 
            output[click[0]][click[1]] = "X"
            return output
        }
        
        let maxRow = board.count
        let maxCol = board.first!.count
        var stack = [(col: Int, row: Int)]()
        stack.append((col: click[1], row: click[0]))
        let neighborMines = countNeighborMines(click[0], click[1], board)
        let isBlanck = neighborMines == 0
        output[click[0]][click[1]] = isBlanck ? "B" : Character(String(neighborMines))
        guard isBlanck else { return output }
        
        let diffX = [-1, 0, 1, -1, 1, -1, 0, 1]
        let diffY = [1, 1, 1, 0, 0, -1, -1, -1]
        while !stack.isEmpty {
            let poppedCell = stack.removeLast()
            for i in 0..<8 {
                let nextRow = poppedCell.row + diffY[i]
                let nextCol = poppedCell.col + diffX[i]
                guard isAccessible(nextRow, nextCol, maxRow, maxCol) else { continue }
                guard output[nextRow][nextCol] == "E" else { continue }
                let neighborMines = countNeighborMines(nextRow, nextCol, board)
                let isBlanck = neighborMines == 0
                output[nextRow][nextCol] = isBlanck ? "B" : Character(String(neighborMines))
                if isBlanck { stack.append((col: nextCol, row: nextRow)) }
            }
        }
        
        return output
    }

    func isAccessible(_ row: Int, _ col: Int, _ maxRow: Int, _ maxCol: Int) -> Bool {
        return row >= 0 && col >= 0 && row < maxRow && col < maxCol
    }
    
    func countNeighborMines(_ row: Int, _ col: Int, _ board: [[Character]]) -> Int {
        let diffX = [-1, 0, 1, -1, 1, -1, 0, 1]
        let diffY = [1, 1, 1, 0, 0, -1, -1, -1]
        let maxRow = board.count
        let maxCol = board.first!.count
        var output = 0
        for i in 0..<8 {
            let nextX = col + diffX[i]
            let nextY = row + diffY[i]
            guard isAccessible(nextY, nextX, maxRow, maxCol) else { continue }
            if board[nextY][nextX] == "M" { output += 1 }
        }
        return output
    }
}
