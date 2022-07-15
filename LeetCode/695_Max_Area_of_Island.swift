class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        
        let maxRow = grid.count
        let maxCol = grid.first!.count
        var visited = Array(repeating: Array(repeating: false, count: maxCol), count: maxRow)
        
        let diffRow = [0,0,1,-1]
        let diffCol = [1,-1,0,0]
        func isValidGrid(_ row: Int, _ col: Int) -> Bool {
            return row >= 0 && row < maxRow && col >= 0 && col < maxCol
        }
        func dfs(_ row: Int, _ col: Int) -> Int {
            visited[row][col] = true 
            var count = 1
            for i in 0..<4 {
                let nextRow = row + diffRow[i]
                let nextCol = col + diffCol[i]
                guard isValidGrid(nextRow, nextCol) else { continue }
                guard grid[nextRow][nextCol] == 1 && !visited[nextRow][nextCol] else { continue }
                visited[nextRow][nextCol] = true 
                count += dfs(nextRow, nextCol)
            }
            return count
        }
        
        var maxSize = 0
        for i in 0..<maxRow {
            for j in 0..<maxCol where grid[i][j] == 1 && !visited[i][j] {
                maxSize = max(maxSize, dfs(i, j))
            }
        }
        return maxSize
    }
}

