class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let sortedArray = (nums1 + nums2).sorted()
        let medianIndex = (sortedArray.count - 1) / 2
        return sortedArray.count % 2 == 0 ? 
            Double(sortedArray[medianIndex] + sortedArray[medianIndex + 1]) / 2.0 : 
            Double(sortedArray[medianIndex])
    }
}
