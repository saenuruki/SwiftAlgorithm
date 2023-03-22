class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        
        var graph = [Int: [(destination: Int, score: Int)]]()
        for road in roads {
            graph[road[0], default: []].append((destination: road[1], score: road[2]))
            graph[road[1], default: []].append((destination: road[0], score: road[2]))
        }

        var visitedNums = Set<Int>()
        var minScore = Int.max
        var queue = [1]
        var pointer = 0
        while pointer < queue.count {
            let num = queue[pointer]
            visitedNums.insert(num)
            if let targets = graph[num] {
                for target in targets {
                    if !visitedNums.contains(target.destination) { 
                        queue.append(target.destination)
                    }
                    minScore = min(minScore, target.score)
                }
            }
            pointer += 1
        }

        return minScore
    }
}
