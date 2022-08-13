class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {

        func isValid(upTo upper: Int) -> Bool {
            var count = 0
            for num in time where num <= upper {
                count += upper / num
            }
            return count >= totalTrips
        }
        
        var (low, high) = (1, (time.min() ?? 1) * totalTrips)
        var result = 0
        while low <= high {
            let middle = (high - low) / 2 + low
            if isValid(upTo: middle) {
                result = middle
                high = middle - 1
            } else {
                low = middle + 1
            }
        }
        return result
    }
}



import XCTest
@testable import TestPractice

class LeetCode: XCTestCase {
    func testNo2187() {
        let solution = Solution()
        let testCases: [[Int]] = [
            [1,2,3],
            [2],
            [2,6,9,32,53,12,90,43],
        ]
        let trips: [Int] = [5,1,20]
        let expectations = [3,2,24]
        for i in 0..<testCases.count {
            let output = solution.minimumTime(testCases[i], trips[i])
            XCTAssertEqual(output, expectations[i])
        }
    }
}
