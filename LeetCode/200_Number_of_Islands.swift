class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        let maxRow = grid.count
        let maxCol = grid.first!.count
        var visited = Array(repeating: Array(repeating: false, count: maxCol), count: maxRow)
        
        let diffRow = [0,0,-1,1]
        let diffCol = [-1,1,0,0]
        func dfs(_ row: Int, _ col: Int) {
            visited[row][col] = true
            for i in 0..<4 {
                let nextRow = row + diffRow[i]
                let nextCol = col + diffCol[i]
                guard isInGrid(nextRow, nextCol) else { continue }
                guard !visited[nextRow][nextCol] && grid[nextRow][nextCol] == "1" else { continue }
                dfs(nextRow, nextCol)
            }
        }
        
        func isInGrid(_ row: Int, _ col: Int) -> Bool {
            return row >= 0 && row < maxRow && col >= 0 && col < maxCol
        }
        
        var count = 0
        for i in 0..<maxRow {
            for j in 0..<maxCol where !visited[i][j] && grid[i][j] == "1" {
                dfs(i, j)
                count += 1
            }
        }
        
        return count
    }
}
