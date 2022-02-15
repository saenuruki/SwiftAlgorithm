class Solution {
    func hIndex(_ citations: [Int]) -> Int {

        // time: O(NlogN)
        let sortedCitations = citations.sorted(by: > )
        var maximum = 0

        // time: O(N)
        for i in 0..<citations.count {
            if sortedCitations[i] >= i + 1 {
                maximum = i + 1
            }
        }
        return maximum
    }
}
