// Dynamic Programing
class Solution {
    func minPathCost(_ grid: [[Int]], _ moveCost: [[Int]]) -> Int {
       
        var dp = Array(repeating: Int.max, count: moveCost.count)
        for value in grid[0] {
            dp[value] = value
        }

        for row in 0..<grid.count - 1 {
            for col in 0..<grid.first!.count {
                let num = grid[row][col]
                for nextTarget in 0..<grid.first!.count {
                    let move = moveCost[num][nextTarget]
                    let next = grid[row + 1][nextTarget]
                    dp[next] = min(dp[next], dp[num] + move + next)
                }
            }
            row += 1
        }
        
        return grid.last!.map({ dp[$0] }).min() ?? 0
    }
}

// backtracking
class Solution {
    func minPathCost(_ grid: [[Int]], _ moveCost: [[Int]]) -> Int {
        
        func dfs(_ cellCosts: [Int], _ moveCosts: [Int], _ pointer: Int, _ index: Int) -> Int {
            var thisCellCosts = cellCosts
            var thisMoveCosts = moveCosts
            let currentCellCost = cellCosts.reduce(0, +)
            let currentMoveCost = moveCosts.reduce(0, +)
            guard pointer < grid.count - 1 else { return currentCellCost + currentMoveCost + grid[pointer][index] }

            var output = Int.max
            let num = grid[pointer][index]
            let theCosts = moveCost[num]
            thisCellCosts.append(num)
            for i in 0..<theCosts.count {
                guard currentCellCost + currentMoveCost + theCosts[i] + num < output else { continue }
                thisMoveCosts.append(theCosts[i])
                output = min(output, dfs(thisCellCosts, thisMoveCosts, pointer + 1, i))
                thisMoveCosts.removeLast()
            }
            thisCellCosts.removeLast()
            
            return output
        }   
        
        var output = Int.max
        for i in 0..<moveCost.first!.count {
            output = min(output, dfs([], [], 0, i))
        }
        return output
    }
}

