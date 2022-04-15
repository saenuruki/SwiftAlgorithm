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
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard var root = root else { return root }
        
        while root.val < low || root.val > high {
            if root.val < low {
                guard let rightNode = root.right else { return nil }
                root = rightNode
            } else if root.val > high {
                guard let leftNode = root.left else { return nil }
                root = leftNode
            }
        }
        
        var output = root
        output.right = trimBST(output.right, low, high)
        output.left = trimBST(output.left, low, high)

        return output
    }
}
