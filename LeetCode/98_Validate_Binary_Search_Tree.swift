/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var queue = [QueueItem]()
        queue.append(QueueItem(node: root, min: Int.min, max: Int.max))
        var pointer = 0
        while pointer < queue.count {
            let queueItem = queue[pointer]
            // print("\(queueItem.node.val) \(queueItem.min) \(queueItem.max)")
            if let leftNode = queueItem.node.left {
                guard leftNode.val > queueItem.min && leftNode.val < queueItem.node.val 
                else { return false }
                
                queue.append(QueueItem(node: leftNode, min: queueItem.min, max: queueItem.node.val))
            }
            if let rightNode = queueItem.node.right {
                guard rightNode.val > queueItem.node.val && rightNode.val < queueItem.max
                else { return false }
                queue.append(QueueItem(node: rightNode, min: queueItem.node.val, max: queueItem.max))
            }
            pointer += 1
        }
        return true
    }
}

struct QueueItem {
    let node: TreeNode
    let min: Int
    let max: Int
}


// BFS + Queue



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

