
class Trie {
    
    var root: Node<Character>

    init() { 
        root = Node("*")
    }
    
    func insert(_ word: String) {
        var head = self.root
        for char in word {
            head = head.add(char)
        }
        head.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        var head = self.root
        for char in word {
            guard let nextNode = head.children[char] else { return false }
            head = nextNode
        }
        return head.isWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var head = self.root
        for char in prefix {
            guard let nextNode = head.children[char] else { return false }
            head = nextNode
        }
        return true
        
    }
}

// MARK: have to set class
class Node<T: Hashable> {
    var value: T
    var isWord: Bool = false
    var children = [T: Node]()
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ value: T) -> Node {
        if let node = children[value] { return node }
        children[value] = Node(value)
        return children[value]!
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
