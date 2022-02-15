class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var pairs = [Int: Bool]() // key: num, value: appear twice
        
        for num in nums {
            if let value = pairs[num] {
                pairs[num] = true
            } else {
                pairs[num] = false
            }
        }
        
        return pairs.filter({ !$0.value }).first!.key
    }
}
