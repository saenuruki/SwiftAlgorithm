class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first! }
        guard nums.first! > nums.last! else { return nums.first! }
        
        return binearySearch(nums, 0, nums.count - 1)
    }
    
    func binearySearch(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        guard end - start > 0 else { return nums[start] }
        let middleIndex = ((end - start) / 2) + start
        if middleIndex > 0, nums[middleIndex - 1] > nums[middleIndex] { return nums[middleIndex] }
        if middleIndex < nums.count - 1, nums[middleIndex] > nums[middleIndex + 1] { return nums[middleIndex + 1] }
        if nums[start] > nums[middleIndex] {
            return binearySearch(nums, start, middleIndex - 1)
        } else {
            return binearySearch(nums, middleIndex + 1, end)
        }
    }
}
