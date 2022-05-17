i/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the binary tree.
    //   - space: O(1), only constant space is used.
    
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        
        var queue: [Node] = [root]
        while queue.count > 0 {
            var level = [Node]()
            var prev: Node?
            
            for node in queue {
                if let leftNode = node.left { level.append(leftNode) }
                if let rightNode = node.right { level.append(rightNode) }
                if prev != nil { prev?.next = node}
                prev = node
            }
            queue = level
        }
        return root
    }
}
