class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        return binarySearch(nums: nums, target: target, lowerIndex: 0, upperIndex: nums.count - 1)
    }
    
    // return the index
    func binarySearch(nums: [Int], target: Int, lowerIndex: Int, upperIndex: Int) -> Int {
        guard upperIndex > lowerIndex else {
            if nums[lowerIndex] == target { return lowerIndex }
            return -1
        }
        let middleIndex = (upperIndex - lowerIndex) / 2 + lowerIndex
        if nums[middleIndex] == target {
            return middleIndex
        } else if nums[middleIndex] < target {
            return binarySearch(nums: nums, target: target, lowerIndex: middleIndex + 1, upperIndex: upperIndex)
        } else {
            return binarySearch(nums: nums, target: target, lowerIndex: lowerIndex, upperIndex: middleIndex - 1)
        }
    }
}
