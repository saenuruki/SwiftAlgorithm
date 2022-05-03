class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        let sortedNums = nums.sorted()
        var start = 0
        var end = nums.count - 1
        
        while start < nums.count && nums[start] == sortedNums[start] {
            start += 1
        }
        guard start < nums.count - 1 else { return 0 } // already sorted
        
        while end >= 0 && nums[end] == sortedNums[end] {
            end -= 1
        }
        
        return end - start + 1
    }
}
