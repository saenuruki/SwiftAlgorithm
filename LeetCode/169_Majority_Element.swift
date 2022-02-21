class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else { return 0 }
        var cache = [Int: Int]() // key: num, value: count
        for num in nums {
            if let value = cache[num] {
                if value + 1 > nums.count / 2 { return num }
                cache[num] = value + 1
            } else {
                cache[num] = 1
            }
        }
        return cache.max(by: { a, b in a < b })!.key
    }
}
