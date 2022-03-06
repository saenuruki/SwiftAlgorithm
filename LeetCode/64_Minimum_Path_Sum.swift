// Dynamic Programing with Memo Cache
// Time: O(NM)
// Space: O(NM)

class Solution {
    
    var memo = [String: Int]() // key: row+column, value: score

    func minPathSum(_ grid: [[Int]]) -> Int {
        return minPathSum(grid, row: 0, column: 0)
    }
    
    func minPathSum(_ grid: [[Int]], row: Int, column: Int) -> Int {
        if row == grid.count - 1 && column == grid.first!.count - 1 { 
            memo["\(row):\(column)"] = grid[row][column]
            return grid[row][column]
        }
        
        var rightScore: Int {
            guard column + 1 < grid.first!.count else { return 1000 }
            if let score = memo["\(row):\(column + 1)"] { return score }
            return minPathSum(grid, row: row, column: column + 1)
        }
        
        var bottomScore: Int {
            guard row + 1 < grid.count else { return 1000 }
            if let score = memo["\(row + 1):\(column)"] { return score }
            return minPathSum(grid, row: row + 1, column: column)
        }
        
        let thisScore = min(rightScore, bottomScore) + grid[row][column]
        memo["\(row):\(column)"] = thisScore
        return thisScore
    }
}
