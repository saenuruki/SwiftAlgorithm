class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        
        // hashMap
        var hashMap = [Int: Int]() // key: num, value: count
        for num in nums {
            hashMap[num, default: 0] += 1
        }
        
        return hashMap
            .sorted(by: { $0.value == $1.value ? $0.key > $1.key : $0.value < $1.value })
            .flatMap({ Array(repeating: $0.key, count: $0.value) })
    }
}
