// time: O(N)
// space: O(N)
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {        

        var outputs = [Int]() 
        for i in 0..<nums.count {
            guard i >= 2 else { outputs.append(nums[i]); continue }
            if nums[i] != nums[i - 2] {
                outputs.append(nums[i])
            }
        }
        nums = outputs
        return outputs.count
    }
}
