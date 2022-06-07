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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        return pathSum(root, targetSum, [])
    }
    
    func pathSum(_ root: TreeNode, _ targetSum: Int, _ stack: [Int]) -> [[Int]] {        
        // is leaf
        if root.left == nil && root.right == nil {
            if stack.reduce(0, +) + root.val == targetSum {
                return [stack + [root.val]]
            } else {
                return []
            }
        } else {
            var leftOutput: [[Int]] {
                if let leftNode = root.left {
                    return pathSum(leftNode, targetSum, stack + [root.val])
                } else {
                    return [[Int]]()
                }
            }
            var rightOutput: [[Int]] {
                if let rightNode = root.right {
                    return pathSum(rightNode, targetSum, stack + [root.val])
                } else {
                    return [[Int]]()
                }
            }
            return leftOutput + rightOutput
        }
    }
}
