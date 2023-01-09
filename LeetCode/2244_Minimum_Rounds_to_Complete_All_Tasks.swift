class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        
        // 1. make duplicated level map
        var levelMap = [Int: Int]()
        for task in tasks {
            levelMap[task, default: 0] += 1
        }

        // 2. convert the count into score
        let score = levelMap.values.map({ $0 > 1 ? (($0 - 1) / 3) + 1 : -1 })
        if score.filter({ $0 == -1 }).count > 0 { return -1 }
        return score.reduce(0, +)
    }
}
