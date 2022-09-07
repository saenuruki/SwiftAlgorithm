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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard var output = root else { return nil }
        let isLeftNil = pruneTree(output.left) == nil
        let isRightNil = pruneTree(output.right) == nil
        if isLeftNil { output.left = nil }
        if isRightNil { output.right = nil }
        if isLeftNil && isRightNil && output.val == 0 { return nil }

        return output
    }
}
