class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        
        var pointer = 0
        var output = [String]()
        for i in 0..<nums.count {
            if nums.count == i + 1 {
                output.append(pointer == i ? "\(nums[i])" : "\(nums[pointer])->\(nums[i])")
            } else {
                if nums[i + 1] - nums[i] == 1 {
                    continue
                } else {
                    output.append(pointer == i ? "\(nums[i])" : "\(nums[pointer])->\(nums[i])")
                    pointer = i + 1
                }
            }
        }
        return output
    }
}
