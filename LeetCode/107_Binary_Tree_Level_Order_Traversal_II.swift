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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [[Int]]() }
        var output = [[Int]]()
        var currentLevel = 0
        var currentVals = [Int]()
        var queue = [(node: TreeNode, level: Int)]()
        var pointer = 0
        queue.append((node: root, level: 0))
        while pointer < queue.count {
            let thisTuple = queue[pointer]
            if currentLevel != thisTuple.level {
                output.append(currentVals)
                currentLevel = thisTuple.level
                currentVals = [Int]()
            }
            currentVals.append(thisTuple.node.val)    
            
            if let leftNode = thisTuple.node.left {
                queue.append((node: leftNode, level: thisTuple.level + 1))
            }
            if let rightNode = thisTuple.node.right {
                queue.append((node: rightNode, level: thisTuple.level + 1))
            }
            pointer += 1
        }
        output.append(currentVals)
        return output.reversed()
    }
}
