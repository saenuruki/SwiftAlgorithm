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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return isMatch(p, q)
    }
    
    func isMatch(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p?.val == q?.val else { return false }
        if p == nil { return true }
        return isMatch(p?.left, q?.left) && isMatch(p?.right, q?.right)
    }
}
