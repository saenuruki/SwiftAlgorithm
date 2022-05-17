/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue: [(node: TreeNode, level: Int)] = [(node: root, level: 0)]
        var pointer = 0
        var levelSums = [Int: Int]() // key: level, value: sum
        
        while pointer < queue.count {
            let tuple = queue[pointer]
            let thisLevelSum = levelSums[tuple.level, default: 0]
            levelSums[tuple.level] = thisLevelSum + tuple.node.val
            if let leftNode = tuple.node.left {
                queue.append((node: leftNode, level: tuple.level + 1))
            }
            if let rightNode = tuple.node.right {
                queue.append((node: rightNode, level: tuple.level + 1))
            }
            pointer += 1
        }
        
        let maxLevel = levelSums.keys.max()!
        return levelSums[maxLevel] ?? 0
    }
}
