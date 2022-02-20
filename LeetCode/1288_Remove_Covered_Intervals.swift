// time: O(NlogN)
// space: O(N)
class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        
        // time: O(NlogN)
        let sortedIntervals: [[Int]] = intervals.sorted(by: { interval1, interval2 -> Bool in
            if interval1.first! == interval2.first! {
                return interval1.last! > interval2.last!
            } else { 
                return interval1.first! < interval2.first!
            }
        })
        // time: O(N)
        let filterdIntervals: [[Int]] = sortedIntervals.reduce([]) { result, interval in 
            var newResult = result                                              
            if result.count == 0 {
                newResult.append(interval)
            } else if newResult.last!.last! < interval[1] {
                newResult.append(interval)
            } else {
                // do nothing
            }
            return newResult                                              
        }

        return filterdIntervals.count
    }
}
