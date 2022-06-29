class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let sorted = people.sorted(by: { lhs, rhs in
            lhs[0] == rhs[0] ? lhs[1] < rhs[1] : lhs[0] > rhs[0]
        })
        var result: [[Int]] = []
        for people in sorted {
            result.insert(people, at: people[1])
        }
        return result
    }
}
