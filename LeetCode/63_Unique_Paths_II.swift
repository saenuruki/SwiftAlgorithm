class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        // 0. Early return
        guard obstacleGrid.first!.first! != 1 && obstacleGrid.last!.last! != 1 else { return 0 }

        // 1. create usable grids
        var updatableGrid = [[Int]]()
        for row in obstacleGrid {
            let fixedRow = row.map { $0 == 1 ? -1 : 0 }
            updatableGrid.append(fixedRow)
        }
        
        // 2. count possible paths
        updatableGrid[0][0] = 1
        for i in 0..<updatableGrid.count {
            for j in 0..<updatableGrid.first!.count {
                guard updatableGrid[i][j] != -1 else { continue }
                guard i > 0 || j > 0 else { continue }
                var topValue: Int {
                    guard i >= 1 else { return 0 }
                    guard updatableGrid[i-1][j] != -1 else { return 0 }
                    return updatableGrid[i-1][j]
                }
                var leftValue: Int {
                    guard j >= 1 else { return 0 }
                    guard updatableGrid[i][j-1] != -1 else { return 0 }
                    return updatableGrid[i][j-1]
                }
                updatableGrid[i][j] = topValue + leftValue
            }
        }
        return updatableGrid.last!.last!
    }
}

// 数を求めるため、深さ優先探索で、パスがあれば１つカウントする

// 0: 通れる
// 1: 通れない -> -1に変更
// 1~n: Possibleカウント

// 333310x0
// 00x21x00
// 00x111x0
// 0000x111

// 11111111
// 1x0x12x1
// 11xxx2x1
// 12222445
