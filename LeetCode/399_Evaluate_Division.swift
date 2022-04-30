class Solution {
    
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        
        guard equations.count > 0 && equations.count == values.count && queries.count > 0 else { return [-1.0] }
        
        var graph: [String: [(String, Double)]]()
        
        for (index, equation) in equations.enumerated() {
            graph[equation[0], default: []].append((equation[1], values[index]))
            graph[equation[1], default: []].append((equation[0], 1.0 / values[index]))
        }
        
        return queries.map {
            var visited: Set<String> = []
            var result: Double = -1.0
            calcDFS(&graph, $0, &visited, &result)
            return result
        }
    }
    
    func calcDFS(_ graph: inout [String: [(String, Double)]], _ query: [String], _ visited: inout Set<String>, _ answer: inout Double) -> Bool {
        guard let neighbors = graph[query[0]], graph[query[1]] != nil else { return false }
        
        if query[0] == query[1] {
            answer = 1.0
            return true
        }
        
        visited.insert(query[0])
        
        for neighbor in neighbors {
            if neighbor.0 == query[1] {
                answer = neighbor.1
                return true
            }
            
            if !visited.contains(neighbor.0) {
                if calcDFS(&graph, [neighbor.0, query[1]], &visited, &answer) {
                    answer = answer * neighbor.1
                    return true
                }
            }
            
            visited.remove(query[0])
            
            return false
        }
    }
}
