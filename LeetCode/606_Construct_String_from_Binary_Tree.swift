
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
    func tree2str(_ root: TreeNode?) -> String {
        var output = ""
        guard let root = root else { return output }

        output += String(root.val)
        if let leftNode = root.left {
            output += "(" + tree2str(leftNode) + ")"            
        } else if let rightNode = root.right {
            output += "()"   
        }
        if let rightNode = root.right {
            output += "(" + tree2str(rightNode) + ")"            
        }
        
        return output
    }
}
