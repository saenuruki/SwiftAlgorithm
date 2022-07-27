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
    func flatten(_ root: TreeNode?) {
        // convert B-Tree into stack
        var stack = [TreeNode]()
        dfs(root, &stack)
        
        guard stack.count > 1 else { return }
        var pointer = stack[0]
        for index in 1..<stack.count {
            pointer.left = nil
            pointer.right = stack[index]
            pointer = stack[index]
        }
        pointer.left = nil
        pointer.right = nil
    }
    
    func dfs(_ root: TreeNode?, _ stack: inout [TreeNode]) {
        guard let root = root else { return }
        stack.append(root)
        dfs(root.left, &stack)
        dfs(root.right, &stack)
    }
}
