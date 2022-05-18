class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var matrix = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                guard i > 0 || j > 0 else { continue }
                let topGrid = isValidRange(i - 1, j, m, n) ? matrix[i - 1][j] : 0
                let leftGrid = isValidRange(i, j - 1, m, n) ? matrix[i][j - 1] : 0
                matrix[i][j] = topGrid + leftGrid
            }
        } 
        
        return matrix.last!.last!
    }
    
    func isValidRange(_ i: Int, _ j: Int, _ m: Int, _ n: Int) -> Bool {
        return i >= 0 && i < m && j >= 0 && j < n
    }
}
