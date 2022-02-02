class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k != 0 else { return }
        
        let modK = k % nums.count
        let first = Array(nums[0..<nums.count-modK])
        let last = Array(nums[nums.count-modK..<nums.count])
        nums = last + first
    }
}
