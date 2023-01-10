class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var newBoard = board

        func updateX(row: Int, col: Int) {
            guard newBoard[row][col] == "X" else { return }
            newBoard[row][col] = "O"
            if row + 1 < board.count { updateX(row: row + 1, col: col) }
            if col + 1 < board.first!.count { updateX(row: row, col: col + 1) }
        }

        var battleshipCount = 0
        for row in 0..<board.count {
            for col in 0..<board.first!.count where newBoard[row][col] == "X" {
                battleshipCount += 1
                updateX(row: row, col: col)
            }
        }
        return battleshipCount
    }
}
