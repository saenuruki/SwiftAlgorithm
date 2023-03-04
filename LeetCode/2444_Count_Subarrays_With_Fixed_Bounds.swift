class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        
        var result = 0

        var minIndex: Int?
        var maxIndex: Int?
        var startIndex = -1
        
        for i in (0..<nums.count) {
            if (nums[i] < minK || nums[i] > maxK) {
                minIndex = nil
                maxIndex = nil
                startIndex = i
            }
            
            if nums[i] == minK {
                minIndex = i
            }
            if nums[i] == maxK {
                maxIndex = i
            }
            
            if let minIndex = minIndex, let maxIndex = maxIndex {
                result += min(maxIndex , minIndex) - startIndex
            }
        }
        
        return result
    }
}
