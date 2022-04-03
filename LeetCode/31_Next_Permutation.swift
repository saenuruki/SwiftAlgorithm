class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else { return } // don't need to do anything 
        var tailPointer = nums.count - 1
        
        while true {
            guard tailPointer != 0 else { nums.sort(); return }
            tailPointer -= 1
            guard nums[tailPointer + 1] <= nums[tailPointer] else { break }
        }
        
        // only sort the array after tailPointer
        let headNums = tailPointer == 0 ? [] : Array(nums[0..<tailPointer])
        var tailNums = Array(nums[tailPointer..<nums.count])
        let tailFirst = tailNums.first!
        tailNums.sort()
        var nextTailNums: [Int] {
            for i in 0..<tailNums.count {
                if tailNums[i] > tailFirst {
                    let removedNum = tailNums.remove(at: i)
                    return [removedNum] + tailNums
                }
            }
            return tailNums
        }
        nums = headNums + nextTailNums
    }
}
