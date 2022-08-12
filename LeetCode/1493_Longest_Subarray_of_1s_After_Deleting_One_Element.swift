class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        let zeros = nums.filter({ $0 == 0 })
        guard zeros.count != nums.count else { return 0 } // all 0
        guard !zeros.isEmpty else { return nums.count - 1 } // all 1
        
        var dp1 = Array(repeating: 0, count: nums.count)
        var dp2 = Array(repeating: 0, count: nums.count)
        dp1[0] = nums[0]
        dp2[0] = nums[0]
        for i in 1..<nums.count {
            if nums[i] == 0 {
                dp1[i] = 0
                dp2[i] = dp1[i - 1]
            } else { // == 1
                dp1[i] = dp1[i - 1] + 1
                dp2[i] = dp2[i - 1] + 1
            }
        }
        return dp2.max() ?? 0
    }
}


import XCTest
@testable import TestPractice

class LeetCode: XCTestCase {
    func testNo1493() {
        let solution = Solution()
        let testCases: [[Int]] = [
            [1,1,0,1],
            [0,1,1,1,0,1,1,0,1],
            [1,1,1],
            [0,0,0,0,0,0,0,0],
            [0,0,1,1,0,0,1,1,1,0,1,0,1,0,0,0,1,1,0]
        ]
        let expectations = [3,5,2,0,4]
        for i in 0..<testCases.count {
            let output = solution.longestSubarray(testCases[i])
            XCTAssertEqual(output, expectations[i])
        }
    }
}
