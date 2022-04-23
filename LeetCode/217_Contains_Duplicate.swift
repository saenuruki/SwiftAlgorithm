// Time: O(N)
// Space: O(N)

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        var cache = Set<Int>()
        
        for num in nums {
            if cache.contains(num) { return true }
            cache.insert(num)
        }
        return false
    }
}
