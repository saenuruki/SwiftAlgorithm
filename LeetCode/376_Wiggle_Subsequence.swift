class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var prevDiff = nums[1] - nums[0]
        var count = prevDiff != 0 ? 2 : 1
        guard nums.count > 2 else { return count }
        for i in 2..<nums.count {
            let diff = nums[i] - nums[i - 1]
            if (diff > 0 && prevDiff <= 0) || (diff < 0 && prevDiff >= 0) {
                count += 1
                prevDiff = diff
            }
        }
        return count
    }
}
