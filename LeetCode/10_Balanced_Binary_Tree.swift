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
    func isBalanced(_ root: TreeNode?) -> Bool {
       return countHeight(root) != -1
    }
    
    func countHeight(_ root: TreeNode?) -> Int {
        guard let rootNode = root else { return 0 }
        
        let leftHeight = countHeight(rootNode.left)
        if leftHeight == -1 { return -1 }
        
        let rightHeight = countHeight(rootNode.right)
        if rightHeight == -1 { return -1 }
        
        if abs(leftHeight - rightHeight) > 1 { return -1 }
        
        return max(leftHeight, rightHeight) + 1
    }
}
