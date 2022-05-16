class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        
        guard !(grid.first!.first == 1 || grid.last!.last == 1) else { return -1 }
    
        // 1. Setup
        var memoGrid = [[Int]]()
        for row in grid {
            let fixedRow = row.map { $0 == 1 ? -1 : Int.max }
            memoGrid.append(fixedRow)
        }
        
        // 2. BFS + DP
        let maxRow = grid.count
        let maxCol = grid.first!.count
        let diffX = [-1, 0, 1, -1, 1, -1, 0, 1]
        let diffY = [-1, -1, -1, 0, 0, 1, 1, 1]
        var stack: [(row: Int, col: Int)] = [(row: 0, col: 0)]
        var pointer = 0
        memoGrid[0][0] = 1
        
        func isValidRange(_ row: Int, _ col: Int) -> Bool {
            return row >= 0 && row < maxRow && col >= 0 && col < maxCol
        }
        
        while pointer < stack.count {
            let cell = stack[pointer]
            let currentScore = memoGrid[cell.row][cell.col]
            
            for i in 0..<8 {
                let nextRow = cell.row + diffY[i]
                let nextCol = cell.col + diffX[i]
                guard isValidRange(nextRow, nextCol) else { continue }
                let nextScore = memoGrid[nextRow][nextCol]
                guard nextScore != -1 else { continue }
                if nextScore > currentScore + 1 {
                    memoGrid[nextRow][nextCol] = currentScore + 1
                    stack.append((row: nextRow, col: nextCol))
                }
            }
            pointer += 1
        }
        if memoGrid[maxRow - 1][maxCol - 1] == Int.max { return -1 }
        return memoGrid[maxRow - 1][maxCol - 1]
    }
}



