class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        // We just treat unique pattern, then we don't need to care same number
        var count = 0
        
        // There are two approach 
        // time: O(N)
        if k == 0 {
            var cacheTable = [Int: Int]() // space: O(N) key: num, value: count
            for num in nums {
                if let value = cacheTable[num] {
                    guard value < 2 else { continue }
                    count += 1   
                    cacheTable[num] = value + 1
                } else {
                    cacheTable[num] = 1
                }
            }
        } else {
            var cacheSet = Set<Int>() // space: O(N)
            for num in nums {
                if cacheSet.contains(num - k) && !cacheSet.contains(num) {
                    count += 1   
                }
                if cacheSet.contains(num + k) && !cacheSet.contains(num) {
                    count += 1
                }
                cacheSet.insert(num)
            }
        }

        return count
    }
}
