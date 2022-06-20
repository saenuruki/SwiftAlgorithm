class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        
        var cache = [Int: Int]() // key: num, value: the last index
        for i in 0..<nums.count {
            let num = nums[i]
            if let lastIndex = cache[num] {
                if i - lastIndex <= k { return true }
            }
            cache[num] = i
        }
        return false 
    }
}
