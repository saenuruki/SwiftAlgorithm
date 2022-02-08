class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        // we can change up to 3 nums
        guard nums.count > 4 else { return 0 }
        
        // sort O(NlogN)
        let sortedNums = nums.sorted()
        
        // [1, 2, 3, 4, 100, 101, 102]
        //  ↑　　　　　↑
        // 　  ↑　　　　　　↑
        //  　　　 ↑　　　　 　　↑
        // 　　　　　 ↑　　　　　　　 　↑
        
        // Sliding window O(4)
        var output = sortedNums.last! - sortedNums.first!
        for i in 0...min(3, sortedNums.count - 3)  {
            output = min(output, sortedNums[sortedNums.count - 4 + i] - sortedNums[i])
        }
        return output
    }
}
