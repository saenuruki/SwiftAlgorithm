class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard !intervals.isEmpty else { return [newInterval] }

        // 1. find suable place O(logN)
        let newIndex = binarySearch(intervals, newInterval)
        var newIntervals = intervals
        newIntervals.insert(newInterval, at: newIndex)
        
        // 2. merge each interval O(N)
        var output: [[Int]] = [newIntervals.first!]
        for i in 1..<newIntervals.count {
            let lastInterval = output.last!
            let thisInterval = newIntervals[i]
            if lastInterval.last! >= thisInterval.first!  {
                output.removeLast()
                output.append([
                    min(lastInterval.first!, thisInterval.first!),
                    max(lastInterval.last!, thisInterval.last!)
                ])
            } else {
                output.append(thisInterval)
            }
        }
        
        return output
    }
}

// return the index
func binarySearch(_ intervals: [[Int]], _ newInterval: [Int]) -> Int {
    var head = 0
    var tail = intervals.count - 1

    while head < tail {
        let middle = ((tail - head) / 2) + head
        
        if intervals[middle].first! == newInterval.first! {
            return middle + 1
        } else if intervals[middle].first! < newInterval.first! {
            head = middle + 1
        } else {
            tail = middle - 1
        }
    }
    
    let targetIndex = max(head, tail)
    return intervals[targetIndex].first! <= newInterval.first! ? targetIndex + 1 : targetIndex
    
}
