// Time: O(k)
// Space: O(1)
class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        guard cardPoints.count > k else { return cardPoints.reduce(0,+) }
        
        var total = 0
        for i in 0..<k {
            total += cardPoints[i]
        }
        
        var pointer = k - 1
        var tail = cardPoints.count - 1
        var output = total
        while pointer >= 0 {
            total -= cardPoints[pointer]
            total += cardPoints[tail]
            output = max(output, total)
            pointer -= 1
            tail -= 1
        }
        return output
    }
}


