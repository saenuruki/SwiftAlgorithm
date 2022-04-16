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
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        return convertBST(root, 0).node
    }

    func convertBST(_ root: TreeNode?, _ total: Int) -> (node: TreeNode?, total: Int) {
        guard var root = root else { return (node: root, total: total) }
        
        let newRightTuple = convertBST(root.right, total)
        root.right = newRightTuple.node
        root.val = root.val + newRightTuple.total
        let newLeftTuple = convertBST(root.left, root.val)
        root.left = newLeftTuple.node
        
        return (node: root, total: newLeftTuple.total)
    }
}
