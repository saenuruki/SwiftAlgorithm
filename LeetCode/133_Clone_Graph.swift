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

// Unfortunately become time limit exceeded
class Solution {
    
    var nodeMap = [Int: Node]()
    func cloneGraph(_ node: Node?) -> Node? {
        guard let firstNode = node else { return nil }
        return cloneGraph(firstNode)
    }
    
    func cloneGraph2(_ node: Node) -> Node {
        if let value = nodeMap[node.val] { return value }
        
        var cloneNode = Node(node.val)
        nodeMap[cloneNode.val] = cloneNode
        for neighbor in node.neighbors {
            guard neighbor != nil else { break }
            cloneNode.neighbors.append(cloneGraph2(neighbor!))
        }
        return cloneNode
    }
}
