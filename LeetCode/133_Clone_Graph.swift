/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    
    var copiedNodes = [Int: Node]()

    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        if let copiedNode = copiedNodes[node.val] {
            return copiedNode
        } else {
            var newNode = Node(node.val)
            copiedNodes[node.val] = newNode
            node.neighbors.forEach { neighbor in
                newNode.neighbors.append(cloneGraph(neighbor)) 
            }
            copiedNodes[node.val] = newNode
            return newNode
        }        
    }
}

