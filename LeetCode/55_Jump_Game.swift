class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.filter({ $0 == 0 }).count > 0 else { return true }
        
        var accessibles = Array(repeating: false, count: nums.count)
        accessibles[0] = true
        for i in 0..<nums.count {
            guard accessibles[i] else { return false }
            for j in 0...nums[i] {
                guard i + j < accessibles.count else { break }
                accessibles[i + j] = true
            }
        }
        return accessibles.last!
    }
}

