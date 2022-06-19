class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        
        // 1. make Trie
        var root = Trie()
        for product in products {
            var pointer = root
            for char in product {
                if pointer.children[char] == nil {
                    pointer.children[char] = Trie()
                }
                pointer = pointer.children[char, default: Trie()]
            }
            pointer.isEnd = true
        }
        
        // 2. memo suggestions
        func dfs(_ node: Trie, _ array: [Character]) -> [String] {
            if node.isEnd { node.suggestions.append(String(array)) }
            guard !node.children.isEmpty else { return node.suggestions }
            for (char, childTrie) in node.children {
                node.suggestions += dfs(childTrie, array + [char])
            }
            let suggestCount = node.suggestions.count
            var newSuggestions: [String] = node.suggestions.sorted()
            if suggestCount > 3 { newSuggestions.removeLast(suggestCount - 3) }
            node.suggestions = newSuggestions
            return node.suggestions
        }
        let _ = dfs(root, [])
        
        // 3. make output
        var output = [[String]]()
        var pointer = root
        for word in searchWord {
            if let childTrie = pointer.children[word] {
                pointer = childTrie
                output.append(childTrie.suggestions)
            } else {
                pointer.children.removeAll()
                output.append([])
            }
        }
        
        return output
    }
    
    class Trie {
        var suggestions = [String]()
        var isEnd = false
        var children = [Character: Trie]()
    }
}
