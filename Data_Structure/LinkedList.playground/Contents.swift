import Foundation

// Node
class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(value)"}
        return "\(value) -> " + String(describing: next) + " "
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
node1.next = node2
node2.next = node3
print(node1)

/// LinkedList has the concept of a head and tail, which refers to the first and last nodes of the list respectively
struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {}
    
    var isEmpty: Bool { head == nil }
    
    /// push: adds a value at the front of the list
    /// This is also known as head-first insertion.
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// append: adds a value at the end of the list
    /// This is also known as tail-end insertion.
    mutating func append(_ value: Value) {
        guard !isEmpty else { push(value); return }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    /// insert: 
    @discardableResult
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        if tail === node {
            append(value)
            return tail!
        } else {
            node.next = Node(value: value, next: node.next)
            return node.next!
        }
    }
    
    /// Finding a particular node in the list
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}

var linkedlist1 = LinkedList<Int>()
linkedlist1.push(1)
linkedlist1.push(2)
linkedlist1.push(3)
print(linkedlist1)
// 3 -> 2 -> 1

var linkedlist2 = LinkedList<Int>()
linkedlist2.append(1)
linkedlist2.append(2)
linkedlist2.append(3)
print(linkedlist2)
// 1 -> 2 -> 3



