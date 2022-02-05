import Foundation

/// Binary Search Tree
/// method:
/// - insert
/// - find
/// - delete
/// - getRandomNode

class Node {
    let data: Int
    var left: Node? = nil
    var right: Node? = nil
    var size: Int = 1
    
    init(data: Int) {
        self.data = data
    }
    
    func insertInOrder(with data: Int) {
        if data <= self.data {
            if let leftNode = left {
                leftNode.insertInOrder(with: data)
            } else {
                left = Node(data: data)
            }
        } else {
            if let rightNode = right {
                rightNode.insertInOrder(with: data)
            } else {
                right = Node(data: data)
            }
        }
        size += 1
    }

    func find(data: Int) -> Node? {
        if data == self.data {
            return self
        } else if data < self.data {
            guard let leftNode = left else { return nil }
            return leftNode
        } else if data > self.data {
            guard let rightNode = right else { return nil }
            return rightNode
        }
        return nil
    }
    
    func getRandomNode() -> Node {
        let leftSize: Int = left?.size ?? .zero
        let index = Int.random(in: 0..<size)
        if let leftNode = left, index < leftSize {
            return leftNode.getRandomNode()
        } else if let rightNode = right, index > leftSize {
            return rightNode.getRandomNode()
        } else {
            return self
        }
    }
}

class BinarySearchTree {
    var root: Node? = nil
}

/// In a balanced tree, this algorithm will be O(logN), where N is the number of nodes.
