class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // double binary search
        guard nums.count > 0 else { return [-1, -1] }
        
        var head = 0
        var tail = nums.count - 1
        
        while head < nums.count && tail >= 0 && head <= tail {
            let middle = (tail - head) / 2 + head
            if nums[middle] == target {
                head = middle
                tail = middle
                break
            } else if nums[middle] > target {
                tail = middle - 1
            } else {
                head = middle + 1
            }
        }
        guard head < nums.count && tail >= 0 && head <= tail else { return [-1, -1] }
        
        var isUpdated = true
        while isUpdated {
            isUpdated = false
            if head - 1 >= 0, nums[head - 1] == target { head -= 1; isUpdated = true }
            if tail + 1 < nums.count, nums[tail + 1] == target { tail += 1; isUpdated = true }
        }
        return [head, tail]
    }
}
