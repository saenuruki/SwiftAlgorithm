
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else { return 0 }
        guard triangle.count > 1 else { return triangle[0][0] }
        
        var memo = [String: Int]() // key: row-index, value: the minimum sum of path
        
        func dfs(_ row: Int, _ index: Int) -> Int {
            guard row < triangle.count - 1 else { return triangle[row][index] }
            guard memo["\(row)-\(index)"] == nil else { return memo["\(row)-\(index)"] ?? 0 }
            let leftSum = dfs(row + 1, index)
            let rightSum = dfs(row + 1, index + 1)
            let minimumPathSum = min(leftSum, rightSum) + triangle[row][index]
            memo["\(row)-\(index)"] = minimumPathSum
            return minimumPathSum
        }
        
        return dfs(0, 0)
        
    }
}

// DFS + memoization
// Time: O(N) -> N: all value count
// Space: O(N) -> N: all value count
