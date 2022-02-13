class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var outputs: [[Int]] = [[]]
        
        // time: O(N) N: nums.count
        for i in 0..<nums.count {
            var updatedOutputs = [[Int]]()
            // time: O(M) M: nums.count * 2
            for output in outputs {
                updatedOutputs.append(output)
                updatedOutputs.append(output + [nums[i]])
            }
            outputs = updatedOutputs
        }
        
        return outputs
    }
}
