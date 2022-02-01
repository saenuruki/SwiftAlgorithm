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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        return isMatch(root?.right, root?.left)
    }
    
    func isMatch(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p?.val == q?.val else { return false }
        if p == nil { return true }
        return isMatch(p?.right, q?.left) && isMatch(q?.right, p?.left) 
    }
}
