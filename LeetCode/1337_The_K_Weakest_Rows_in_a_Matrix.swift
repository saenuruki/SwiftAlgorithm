// Time: O(NlogN)
// Space: O(N)

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let soldiers = mat.map({ $0.reduce(0,+) })
        var output = [(index: Int, value: Int)]()
        for (index, value) in soldiers.enumerated() {
            output.append((index: index, value: value))
        }
        let sortedOutput = output.sorted(by: { $0.value < $1.value }).map({ $0.index })
        return Array(sortedOutput[0..<k])
    }
}

// Runtime: 74 ms, faster than 83.78% of Swift online submissions for The K Weakest Rows in a Matrix.
// Memory Usage: 14.1 MB, less than 86.49% of Swift online submissions for The K Weakest Rows in a Matrix.
