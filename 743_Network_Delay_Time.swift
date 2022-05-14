class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        
        var graph = [Int: [Node]]()
        var visited = [Int: Int]()
        
        // 1. setup graph
        for time in times {
            let source = time[0]
            let target = time[1]
            let weight = time[2]
            let newNode = Node(edge: weight, vertex: target)
            let value = graph[source, default: []]
            graph[source] = value + [newNode]
        }
        
        // 2. setup visited
        for source in graph.keys {
            visited[source] = Int.max
        }
        
        // 3. BFS
        var queue: [Int] = [k]
        var pointer = 0
        visited[k] = 0
        while pointer < queue.count {
            let source = queue[pointer]
            let visitedScore = visited[source, default: Int.max]
            let nodes = graph[source, default: []]
            for node in nodes {
                let visitedTarget = visited[node.vertex, default: Int.max]
                if node.edge + visitedScore < visitedTarget {
                    visited[node.vertex] = node.edge + visitedScore
                    queue.append(node.vertex)
                }
            }
            pointer += 1            
        }

        guard visited.keys.count == n else { return -1 } // impossible
        guard visited.values.filter({ $0 == Int.max }).isEmpty else { return -1 } // impossible
        return visited.values.filter({ $0 != Int.max }).max() ?? 0
    }

    struct Node {
        let edge: Int
        let vertex: Int
    }
}
