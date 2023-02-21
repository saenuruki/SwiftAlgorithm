class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        
        for i in 0..<(nums.count / 2) {
            let index = i * 2
            guard (nums[index] + nums[index + 1]) / 2 == nums[index] &&
                (nums[index] + nums[index + 1]) % 2 == 0 else {
                return nums[index]
            }
        }
        return nums.last!
    }
}
