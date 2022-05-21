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
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        
        // 1. find root => toporogical sort
        var dependencies = [Int: (left: Int?, right: Int?)]() // parent: [child] 0, 1
        var hasParent = [Int: Bool]()
        for description in descriptions {
            let dependency = dependencies[description[0]] ?? (left: nil, right: nil)
            if description[2] == 1 { // isLeft
                dependencies[description[0]] = (left: description[1], right: dependency.right)
            } else {
                dependencies[description[0]] = (left: dependency.left, right: description[1])
            }
            hasParent[description[1]] = true
            hasParent[description[0]] = hasParent[description[0]] ?? false
        }
        
        // 2. generate tree => BFS
        var queue = [TreeNode]()
        guard let rootNode = hasParent.filter({ !$0.value }).first else { return nil }
        var pointer = 0
        var output = TreeNode(rootNode.key)
        queue.append(output)

        while pointer < queue.count {
            let dequeuedNode = queue[pointer]
            let dependency = dependencies[dequeuedNode.val] ?? (left: nil, right: nil)
            if let leftNum = dependency.left { 
                dequeuedNode.left = TreeNode(leftNum)
                queue.append(dequeuedNode.left!)
            }
            if let rightNum = dependency.right {
                dequeuedNode.right = TreeNode(rightNum)
                queue.append(dequeuedNode.right!)
            }
            pointer += 1
        }
        return output
    }
}
