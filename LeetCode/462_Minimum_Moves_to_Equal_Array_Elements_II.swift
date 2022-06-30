class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        
        let sortedNums = nums.sorted()
        
        if nums.count % 2 == 0 {
            let middleIndex1 = sortedNums.count / 2 - 1
            let middleIndex2 = sortedNums.count / 2
            return min(calcMoves(sortedNums, middleIndex1), calcMoves(sortedNums, middleIndex2))
        } else {
            let middleIndex = sortedNums.count / 2
            return calcMoves(sortedNums, middleIndex)
        }
    }
    
    func calcMoves(_ nums: [Int], _ targetIndex: Int) -> Int {
        var output = 0
        for num in nums {
            output += abs(num - nums[targetIndex])
        }
        return output
    }
}
