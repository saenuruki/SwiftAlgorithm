/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        typealias Item = (node: Node, level: Int)
        
        // BFS
        var queue = [Item]()
        queue.append((node: root, level: 0))
        var output = [[Int]]()
        var pointer = 0
        while pointer < queue.count {
            let item = queue[pointer]
            if item.level < output.count {
                output[item.level].append(item.node.val)
            } else {
                output.append([item.node.val])
            }
            for child in item.node.children {
                queue.append((node: child, level: item.level + 1))
            }
            
            pointer += 1
        }
        
        return output
    }
}

