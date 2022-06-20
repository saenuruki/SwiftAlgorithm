class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        for i in 0..<nums.count - 1 {
            for j in (i + 1)..<nums.count where j - i <= k && abs(nums[j] - nums[i]) <= t {
                return true
            }
        }
        return false 
    }
}

