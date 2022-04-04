class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else { return 0 }
        var tempMax = nums.first!
        var output = nums.first!
        for index in 1..<nums.count {
            tempMax = max(tempMax + nums[index], nums[index])
            output = max(output, tempMax)
        }
        return output
    }
}
