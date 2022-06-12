class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        
        // Sliding Window
        var numSet = Set<Int>()
        var slowPointer = 0
        var fastPointer = 0
        var score = 0
        var carrentScore = 0
        while fastPointer < nums.count {
            
            while numSet.contains(nums[fastPointer]) && slowPointer <= fastPointer {
                carrentScore -= nums[slowPointer]
                numSet.remove(nums[slowPointer])
                slowPointer += 1
            }
            numSet.insert(nums[fastPointer])
            carrentScore += nums[fastPointer]
            fastPointer += 1
            
            score = max(score, carrentScore)
        }
        
        return score
    }
}
