class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        for num in nums {
            if num == target {
                return true
            }
        }
        return false
    }
}

// Runtime: 24 ms, faster than 91.67% of Swift online submissions for Search in Rotated Sorted Array II.
// Memory Usage: 14.2 MB, less than 40.28% of Swift online submissions for Search in Rotated Sorted Array II.

