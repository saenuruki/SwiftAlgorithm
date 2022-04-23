// Time: O(N)
// Space: O(N)

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var cache = [Int: Int]() // key: num, value: the index 
        
        for index in 0..<nums.count {
            let num = nums[index]
            if let value = cache[num] {
                return [value, index]
            } else {
                cache[target - num] = index
            }
        }
        // if there is no match, just return empty
        return []
    }
}

