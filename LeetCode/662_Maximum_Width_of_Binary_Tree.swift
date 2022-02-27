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
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let rootNode = root else { return 0 }
        
        // BFS
        var queue: [Item] = [Item(node: rootNode, level: 0, horizonIndex: 0)]
        var pointer = 0
        var currentLevel = 0
        var startIndexAtCurrentLevel = 0
        var output = 0 // specific level
        while queue.count > pointer {
            let item = queue[pointer]
            
            if let node = item.node {
                if item.level != currentLevel {
                    currentLevel = item.level
                    startIndexAtCurrentLevel = item.horizonIndex
                }
                if node.right != nil || node.left != nil {
                    queue.append(Item(node: node.left, level: item.level + 1, horizonIndex: item.horizonIndex * 2))
                    queue.append(Item(node: node.right, level: item.level + 1, horizonIndex: item.horizonIndex * 2 + 1))
                }
                output = max(output, item.horizonIndex - startIndexAtCurrentLevel + 1)
            }
            
            pointer += 1
        }
        
        return output
    }

    struct Item {
        let node: TreeNode?
        let level: Int
        let horizonIndex: Int
    }
}
