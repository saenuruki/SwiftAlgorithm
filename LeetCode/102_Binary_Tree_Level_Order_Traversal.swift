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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var stack = [(level: Int, node: TreeNode)]()
        var pointer = 0
        stack.append((level: 1, node: root))
        
        var output = [[Int]]()
        while pointer < stack.count {
            if output.count < stack[pointer].level {
                output.append([stack[pointer].node.val])
            } else {
                output[stack[pointer].level - 1] = output[stack[pointer].level - 1] + [stack[pointer].node.val]
            }
            if let left = stack[pointer].node.left {
                stack.append((level: stack[pointer].level + 1, node: left))
            }
            if let right = stack[pointer].node.right {
                stack.append((level: stack[pointer].level + 1, node: right))
            }
            pointer += 1
        }

        return output
    }
}
