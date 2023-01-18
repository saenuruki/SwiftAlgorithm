class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var localMax = nums[0]
        var globalMax = nums[0]
        var localMin = nums[0]
        var globalMin = nums[0]
        var sum = nums[0]
        for i in 1..<nums.count{
            sum += nums[i]
            localMax = max(nums[i], localMax + nums[i])
            globalMax = max(globalMax, localMax)
            localMin = min(nums[i], localMin + nums[i])
            globalMin = min(globalMin, localMin)
        }
        return (globalMin == sum) ? globalMax : max(globalMax, sum - globalMin)
    }
}
