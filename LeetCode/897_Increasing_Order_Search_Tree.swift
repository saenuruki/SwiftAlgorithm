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
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return root }
        
        var rightHeadNode = increasingBST(root.right)
        var thisNode = TreeNode(root.val, nil, rightHeadNode)
        var leftHeadNode = increasingBST(root.left)

        
        if var leftTailNode = leftHeadNode {
            while true {
                guard let rightNode = leftTailNode.right else { break }
                leftTailNode = rightNode
            }
            leftTailNode.left = nil
            leftTailNode.right = thisNode
        }    
        return leftHeadNode ?? thisNode   
    }
}
