
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [[Int]]() }
        // BFS
        var queue: [(node: TreeNode, level: Int)] = [(node: root, level: 0)]
        var pointer = 0
        var output = [[Int]]()
        while pointer < queue.count {
            let thisNode = queue[pointer]
            if output.count > thisNode.level {
                let lastNodes = output.removeLast()
                output.append(lastNodes + [thisNode.node.val])
            } else {
                output.append([thisNode.node.val])
            }
            if let left = thisNode.node.left {
                queue.append((node: left, level: thisNode.level + 1))
            }
            if let right = thisNode.node.right {
                queue.append((node: right, level: thisNode.level + 1))
            }
            pointer += 1
        }

        var newOutput = [[Int]]()
        for i in 0..<output.count {
            if i % 2 == 0 {
                newOutput.append(output[i])
            } else {
                let nums: [Int] = output[i].reversed().map({ Int($0) })
                newOutput.append(nums)
            }
        }
        return newOutput
    }
}
