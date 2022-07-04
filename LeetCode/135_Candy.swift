class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var sum = 0
        var left2Right = Array(repeating: 1, count: ratings.count)
        var right2Left = Array(repeating: 1, count: ratings.count)
        for i in 1..<ratings.count {
            if ratings[i] > ratings[i - 1] {
                left2Right[i] = left2Right[i - 1] + 1
            }
        }
        for i in stride(from: ratings.count - 2, through: 0, by: -1) {
            if ratings[i] > ratings[i + 1] {
                right2Left[i] = right2Left[i + 1] + 1
            }
        }

        for i in 0..<ratings.count {
            sum += max(left2Right[i], right2Left[i])
        }
        return sum
    }
}
