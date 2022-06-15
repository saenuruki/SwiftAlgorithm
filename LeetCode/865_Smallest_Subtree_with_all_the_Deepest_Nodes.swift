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
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        
        
        func dfs(_ node: TreeNode?, _ level: Int) -> (TreeNode?, Int)? { // return the node and the level
            guard let node = node else { return nil } // there is no change 
            let leftTuple = dfs(node.left, level + 1)
            let rightTuple = dfs(node.right, level + 1)
            if let leftTuple = leftTuple, let rightTuple = rightTuple {
                if leftTuple.1 == rightTuple.1 {
                    return (node, leftTuple.1)
                } else {
                    return leftTuple.1 < rightTuple.1 ? rightTuple : leftTuple
                }
            } else if let leftTuple = leftTuple {
                return leftTuple
            } else if let rightTuple = rightTuple {
                return rightTuple
            } else {
                return (node, level)
            }
        }
        
        guard let (output, _) = dfs(root, 0) else { return nil }
        return output
    }
}
