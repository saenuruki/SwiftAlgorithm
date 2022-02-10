class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var count = 0
        for start in 0..<nums.count {
            var sum = 0
            for end in start..<nums.count {
                sum += nums[end]
                if sum == k { count += 1 }
            }
        }
        
        return count
    }
}
