// Time: O(3N)
// Space: O(1)

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let zeroCount = nums.filter({ $0 == 0 }).count
        guard zeroCount <= 1 else { return Array(repeating: 0, count: nums.count) }
        let multipleNum = zeroCount == 1 ? nums.filter({ $0 != 0 }).reduce(1, *) : nums.reduce(1, *)
        
        return nums.map({ num in
            if num == 0 {
                return multipleNum
            } else if zeroCount == 1 {
                return 0
            } else {
                return multipleNum / num
            }       
        })
    }
}

