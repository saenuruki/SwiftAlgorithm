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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? { 
        guard var pointer = root else { return root }
        
        while true {
            if pointer.val == val {
                return pointer
            } else if pointer.val > val {
                guard let leftNode = pointer.left else { return nil }
                pointer = leftNode
            } else {
                guard let rightNode = pointer.right else { return nil }
                pointer = rightNode
            }
        }
        return nil
    }
}
