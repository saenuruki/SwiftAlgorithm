class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var numDB = [Int: Int]() // key: num ,value: count
        for num in nums {
            numDB[num, default: 0] += 1 
        }
        return numDB.max(by: { $0.value < $1.value })?.key ?? 0
    }
}
