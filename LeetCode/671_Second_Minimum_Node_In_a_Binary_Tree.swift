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
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return -1 }
        let output = findSecondMinimumValue(root)
        guard output.count > 1 else { return -1 }
        return output[1]
    }
    
    func findSecondMinimumValue(_ root: TreeNode) -> [Int] {        
        var leftMinStack: [Int] {
            guard let leftNode = root.left else { return [] }
            return findSecondMinimumValue(leftNode)
        }
        var rightMinStack: [Int] {
            guard let rightNode = root.right else { return [] }
            return findSecondMinimumValue(rightNode)
        }
        let totalStack = leftMinStack + rightMinStack + [root.val]
        return Array(Set(totalStack)).sorted()
    }
}
