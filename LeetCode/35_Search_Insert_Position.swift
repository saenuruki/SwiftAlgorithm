class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        return binarySearch(nums, target, head: 0, tail: nums.count-1) 
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, head: Int, tail: Int) -> Int {
        guard tail - head > 1 else {
            if target <= nums[head] { return head }
            else if target <= nums[tail] { return tail }
            else { return tail + 1 }
        }
        
        let middleIndex = (tail - head)/2 + head
        if target == nums[middleIndex] {
            return middleIndex
        } else if target < nums[middleIndex] {
            return binarySearch(nums, target, head: head, tail: middleIndex)
        } else {
            return binarySearch(nums, target, head: middleIndex, tail: tail)
        }
    }
}
