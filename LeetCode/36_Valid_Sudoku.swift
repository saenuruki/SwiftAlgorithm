// Time: O(9*9*3)
// Space: O(9*9*3)

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var boardSet = Set<String>()
        
        for row in 0..<9 {
            for column in 0..<9 {
                guard board[row][column] != "." else { continue } 
                if boardSet.contains("Row\(row)\(board[row][column])") || 
                    boardSet.contains("Col\(column)\(board[row][column])") || 
                    boardSet.contains("Box\((row/3) + ((column/3)*3))\(board[row][column])") {
                    return false
                } else {
                    boardSet.insert("Row\(row)\(board[row][column])")
                    boardSet.insert("Col\(column)\(board[row][column])")
                    boardSet.insert("Box\((row/3) + ((column/3)*3))\(board[row][column])")   
                }
                
            }
        }
        
        return true   
    }
}
