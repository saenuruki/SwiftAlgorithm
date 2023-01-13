class Solution {
    func longestPath(_ parent: [Int], _ s: String) -> Int {
        let words = Array(s).map({ String($0) })

        // 1. make a graph
        var tree = [Int: [Int]]()
        for index in 0..<parent.count {
            tree[parent[index], default: []].append(index)
            guard parent[index] != -1 else { continue }
            tree[index, default: []].append(parent[index])
        }

        // 2. Define DFS
        func dfs(index: Int, visited: Set<Int>) -> Int {
            var newVisited = visited
            newVisited.insert(index)

            var longestPath = 1
            for child in tree[index, default: []] where !newVisited.contains(child) {
                // let childWord: String = words[child]
                guard words[index] != words[child] else { continue }
                // print("\(child) \(newVisited), \(newStacked)")
                longestPath = max(longestPath, dfs(index: child, visited: newVisited) + 1)
            }
            return longestPath
        }

        // 3. Find the longest path with different adjacent characters
        var longestPath = 0
        for index in 0..<parent.count {
            longestPath = max(longestPath, dfs(index: index, visited: Set<Int>()))
        }
        return longestPath
    }
}
