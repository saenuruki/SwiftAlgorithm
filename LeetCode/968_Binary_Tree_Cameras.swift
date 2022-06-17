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
    func minCameraCover(_ root: TreeNode?) -> Int {
        return calc(root).1
    }
    
    func calc(_ node: TreeNode?) -> (Int, Int) {
        guard let node = node else { return (1, 0) }
        let lhs = calc(node.left)
        let rhs = calc(node.right)
        let pos = (lhs.0, rhs.0)
        let len = lhs.1 + rhs.1
        if pos == (1,1) {
            return (3, len + 1)
        } else if pos == (3,3) {
            return (2, len - 1)
        } else {
            return (max(lhs.0, rhs.0) - 1, len)
        }
    }
}
