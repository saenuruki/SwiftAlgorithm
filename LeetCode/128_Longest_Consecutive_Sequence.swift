// Sort
// Time: O(NlogN)
// Space: O(N)
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        let sortedNums = Array(Set(nums)).sorted()
        var output = 1
        var current = 1
        for i in 1..<sortedNums.count {
            if sortedNums[i] - sortedNums[i - 1] == 1 {
                current += 1
            } else {
                current = 1
            }
            output = max(output, current)
        }
        return output
    }
}

// HashMap
// Time: O(N)
// Space: O(N)
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {

        let numSet = Set(nums)
        
        var output = 0
        for num in numSet where !numSet.contains(num - 1) {
            var currentNum = num
            var currentCount = 1
            while numSet.contains(currentNum + 1) {
                currentNum += 1
                currentCount += 1
            }
            output = max(output, currentCount)
        }
        
        return output
    }
}
