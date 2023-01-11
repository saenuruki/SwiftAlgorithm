class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        let trueCount = hasApple.filter({ $0 }).count
        guard n > 1 && trueCount > 0 else { return 0 }

        var treeMap = [Int: [Int]]()
        for edge in edges {
            treeMap[edge.first!, default: []].append(edge.last!)
            treeMap[edge.last!, default: []].append(edge.first!)
        }

        func dfs(num: Int, visited: Set<Int>) -> Int {
            let isApple = hasApple[num]
            guard let children = treeMap[num]?.filter({ !visited.contains($0) }) else { return isApple ? 2 : 0 }
            var newVisited = visited
            newVisited.insert(num)
            let childSteps = children.map({ dfs(num: $0, visited: newVisited) }).reduce(0, +)
            guard childSteps > 0 || isApple else { return 0 }
            return childSteps + 2
        }

        return max(dfs(num: 0, visited: Set<Int>()) - 2, 0) ?? 0
    }
}
