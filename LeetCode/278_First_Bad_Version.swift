/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

// Time: O(logN)
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var leftPointer = 0
        var rightPointer = n
        while leftPointer <= rightPointer {
            let middle = (leftPointer + rightPointer) / 2
            if !isBadVersion(middle) && isBadVersion(middle + 1) {
                return middle + 1
            } else if isBadVersion(middle) {
                rightPointer = middle
            } else {
                leftPointer = middle + 1
            }
        }
        
        return rightPointer
    }
}

// Time: O(N)
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        for i in 0...n {
            if isBadVersion(i) { return i }
        }
        return n
    }
}
