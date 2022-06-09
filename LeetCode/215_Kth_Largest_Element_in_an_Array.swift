
// Time: O(NlogN)
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else { return 0 }

        // kind of Quick Sort
        var dividedNums = nums
        var remainCount = k - 1
        while dividedNums.count > 1 {
            let middleIndex = dividedNums.count / 2
            let middleNum = dividedNums[middleIndex]
            let upperNums = dividedNums.filter({ $0 > middleNum })
            let thisNums = dividedNums.filter({ $0 == middleNum })
            let lowerNums = dividedNums.filter({ $0 < middleNum })
            if upperNums.count > remainCount {
                dividedNums = upperNums
            } else if thisNums.count > remainCount - upperNums.count {
                remainCount -= upperNums.count
                dividedNums = thisNums
                break
            } else {
                remainCount -= upperNums.count + thisNums.count
                dividedNums = lowerNums
            }
        }
        return dividedNums.first!
    }
}


// Time: O(NlogN)
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else { return 0 }
        let sortedNums = nums.sorted(by: >)
        return sortedNums[k-1]
    }
}
