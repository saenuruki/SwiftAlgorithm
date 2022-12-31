class Solution {
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        
        let emptyCount = grid.flatMap({ $0 }).filter({ $0 == 0 }).count
        var passedSet = Set<String>()
        let nextRows = [0,0,-1,1]
        let nextCols = [-1,1,0,0]

        // return the validation whether the cell is accessible
        func isValidCell(row: Int, col: Int) -> Bool {
            guard row >= 0 && row < grid.count else { return false }
            guard col >= 0 && col < grid.first!.count else { return false }
            return true
        }

        // return the number of 4-directional walks
        func dfs(row: Int, col: Int) -> Int {

            var count = 0
            for i in 0..<4 {
                let nextRow = nextRows[i] + row
                let nextCol = nextCols[i] + col
                guard isValidCell(row: nextRow, col: nextCol) else { continue }
                guard !passedSet.contains("\(nextRow)-\(nextCol)") else { continue }
                if grid[nextRow][nextCol] == 2 && 
                    passedSet.count == emptyCount {
                    count += 1
                    continue
                }
                guard grid[nextRow][nextCol] == 0 else { continue }

                passedSet.insert("\(nextRow)-\(nextCol)")
                count = count + dfs(row: nextRow, col: nextCol)
                passedSet.remove("\(nextRow)-\(nextCol)")
            }
            return count
        }

        for row in 0..<grid.count {
            for col in 0..<grid.first!.count where grid[row][col] == 1 {
                return dfs(row: row, col: col)
            }
        }
        return 0
    }
}
