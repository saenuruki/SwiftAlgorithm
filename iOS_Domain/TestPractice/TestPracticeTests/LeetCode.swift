//
//  LeetCode.swift
//  TestPracticeTests
//
//  Created by 塗木冴 on 2022/08/11.
//

import XCTest
@testable import TestPractice

class LeetCode: XCTestCase {

    func testNo98() {
        let solution = Solution()
        
        let testcases: [[Int?]] = [
            [2,1,3],
            [5,1,4,nil,nil,3,6],
            [3,1,5,0,2,4,6]
        ]
        let expectations: [Bool] = [
            true,
            false,
            true
        ]

        for i in 0..<testcases.count {
            let inputNode = makeTree(testcases[i])
            let output = solution.isValidBST(inputNode)
            XCTAssertEqual(output, expectations[i])
        }
    }
    
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

extension LeetCode {
    func makeTree(_ nums: [Int?], _ index: Int = 0) -> TreeNode? {
        guard index < nums.count else { return nil }
        guard nums[index] != nil else { return nil }
        let leftNode = makeTree(nums, 2 * index + 1)
        let rightNode = makeTree(nums, 2 * index + 2)
        return TreeNode(nums[index]!, leftNode, rightNode)
    }
}
