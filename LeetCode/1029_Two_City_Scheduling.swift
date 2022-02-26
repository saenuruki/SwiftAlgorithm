class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let sortedCosts = costs.map({ Cost(goToCityA: $0[0], goToCityB: $0[1], difference: $0[0] - $0[1])}).sorted(by: { abs($0.difference) > abs($1.difference) })
        
        var countA = 0
        var countB = 0
        var output = 0
        for cost in sortedCosts {
            if countA >= (costs.count / 2) {
                output += cost.goToCityB
                countB += 1
            } else if countB >= (costs.count / 2) {
                output += cost.goToCityA
                countA += 1
            } else {
                if cost.difference > 0 {
                    output += cost.goToCityB
                    countB += 1
                } else {
                    output += cost.goToCityA
                    countA += 1
                }
            }
            
        }
        return output
    }
    
    struct Cost {
        let goToCityA: Int
        let goToCityB: Int
        let difference: Int
    }
}
