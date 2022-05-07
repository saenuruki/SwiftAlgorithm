
class WordDictionary {

    var root: Node<Character>

    init() {
        root = Node("*")
    }
    
    func addWord(_ word: String) {
        var head = root
        for char in word {
            head = head.add(char)
        }
        head.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        return search(Array(word), 0, root)
    }
    
    private func search(_ words: [Character], _ index: Int, _ head: Node<Character>) -> Bool {
        guard index < words.count else { return head.isWord }
        
        if words[index] == "." {
            for (childKey, childValue) in head.children  {
                if search(words, index + 1, childValue) { return true }
            }
            return false
        } else if let nextNode = head.children[words[index]] {
            return search(words, index + 1, nextNode)
        } else {
            return false
        }
    }
}

class Node<T: Hashable> {
    let value: T
    var isWord = false
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
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
