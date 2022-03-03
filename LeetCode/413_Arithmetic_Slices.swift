class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        var output = 0
        
        var stack = [Int]()
        var lastDiff = 0
        for i in 2..<nums.count {
            // is Arithmetic
            if nums[i] - nums[i-1] == nums[i-1] - nums[i-2] {
                if lastDiff == nums[i] - nums[i-1] && !stack.isEmpty {
                    stack.append(nums[i])
                } else {
                    output += calcArithmeticSlicesCount(with: stack.count)
                    stack = [nums[i-2], nums[i-1], nums[i]]
                }
            } else {
                output += calcArithmeticSlicesCount(with: stack.count)
                stack = []   
            }
            lastDiff = nums[i] - nums[i-1]
        }
        output += calcArithmeticSlicesCount(with: stack.count)
        return output
    }
    
    func calcArithmeticSlicesCount(with num: Int) -> Int {
        guard num >= 3 else { return 0 }
        return ((num - 2) * (num - 1)) / 2        
    }
}
