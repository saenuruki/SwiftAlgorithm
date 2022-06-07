
// Time: O((M+N)log(M+N))
// Space: O(M)
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var newNums1 = Array(nums1[0..<m])
        nums1 = (newNums1 + nums2).sorted()
    }
}

// Time: O(M + N)
// Space: O(M)
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var mQueue = Array(nums1[0..<m])
        var pointer = 0
        var mPointer = 0
        var nPointer = 0
        while pointer < m + n {
            if mPointer >= m {
                nums1[pointer] = nums2[nPointer]
                nPointer += 1
            } else if nPointer >= n {
                nums1[pointer] = mQueue[mPointer]
                mPointer += 1
            } else if mQueue[mPointer] <= nums2[nPointer] {
                nums1[pointer] = mQueue[mPointer]
                mPointer += 1
            } else {
                nums1[pointer] = nums2[nPointer]
                nPointer += 1
            }
            pointer += 1
        }
    }
}
