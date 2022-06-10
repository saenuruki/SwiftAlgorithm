class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        let sortedNums = nums.sorted()
        // target: 0
        var output = Set<[Int]>()
        for i in 0..<sortedNums.count - 2 {
            if i > 0, sortedNums[i] == sortedNums[i - 1] { continue }
            var memo = [Int: [Int]]()
            for j in (i + 1)..<sortedNums.count {
                if let theNums = memo[-sortedNums[j]] {
                    output.insert(theNums + [sortedNums[j]])
                }
                memo[sortedNums[i] + sortedNums[j]] = [sortedNums[i], sortedNums[j]]
            }
        }
        return Array(output)
    }
}

