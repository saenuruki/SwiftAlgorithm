class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        var nextMatrix = [[Int]]()
        for i in 0..<n {
            var line = [Int]()
            for j in 0..<n {
                line.append(matrix[j][i])
            }
            nextMatrix.append(line.reversed())
        }
        matrix = nextMatrix
    }
}
