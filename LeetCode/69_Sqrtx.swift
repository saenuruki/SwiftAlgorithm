class Solution {
    func mySqrt(_ x: Int) -> Int {
        
        // let candidates = [Int](0...x)
        var leftPointer = 0
        var rightPointer = x
        while leftPointer < rightPointer {
            let middle = (rightPointer - leftPointer) / 2 + leftPointer
            if middle * middle == x {
                return middle
            } else if middle * middle < x &&  (middle + 1) * (middle + 1) > x {
                return middle
            } else if middle * middle < x {
                leftPointer = middle + 1
            } else {
                rightPointer = middle - 1
            }
        }
        return rightPointer
    }
}
