class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
       
        var target = nums.reduce(0, +) - x
        var currentSum = 0
        var maxLength = 0
        var startIndex = 0
        var isFound = false
        
        for endIndex in 0..<nums.count {
            currentSum += nums[endIndex]
            while startIndex <= endIndex && currentSum > target {
                currentSum -= nums[startIndex]
                startIndex += 1
            }
            if currentSum == target {
                isFound = true
                maxLength = max(maxLength, endIndex - startIndex + 1)
            }
        }
        return isFound ? nums.count - maxLength : -1
    }
}
