// Time: O(N)
// Space: O(1)
class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        guard people.count > 0 else { return .zero }
        let sortedPeople = people.sorted() // Time: O(1)
        var headPointer = 0
        var tailPointer = people.count - 1
        var count = 0

        while headPointer <= tailPointer {
            if sortedPeople[headPointer] + sortedPeople[tailPointer] <= limit {
                headPointer += 1
            }
            count += 1
            tailPointer -= 1
        }
        return count 
    }
}
