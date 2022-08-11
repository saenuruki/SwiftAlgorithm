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
        
        func makeTree(_ nums: [Int?], _ index: Int = 0) -> TreeNode? {
            guard index < nums.count else { return nil }
            guard nums[index] != nil else { return nil }
            let leftNode = makeTree(nums, 2 * index + 1)
            let rightNode = makeTree(nums, 2 * index + 2)
            return TreeNode(nums[index]!, leftNode, rightNode)
        }

        for i in 0..<testcases.count {
            let inputNode = makeTree(testcases[i])
            let output = solution.isValidBST(inputNode)
            XCTAssertEqual(output, expectations[i])
        }
    }
}
