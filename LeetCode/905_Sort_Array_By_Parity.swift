class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        let evenNums = nums.filter { $0 % 2 == 0 }
        let oddNums = nums.filter { $0 % 2 != 0 }
        return evenNums + oddNums
    }
}
