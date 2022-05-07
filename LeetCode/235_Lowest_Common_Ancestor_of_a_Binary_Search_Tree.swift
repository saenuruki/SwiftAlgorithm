/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil } // because there is no tree
        guard let pNode = p, let qNode = q else { return nil } // because we can't compare them
        
        if root.val > pNode.val && root.val > qNode.val {
            return lowestCommonAncestor(root.left, p, q)
        } else if root.val < pNode.val && root.val < qNode.val {
            return lowestCommonAncestor(root.right, p, q)
        } else {
            return root
        }
    }
}
