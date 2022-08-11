//
//  LeetCode.swift
//  TestPractice
//
//  Created by 塗木冴 on 2022/08/11.
//

import Foundation

// No.98
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

struct QueueItem {
    let node: TreeNode
    let min: Int
    let max: Int
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var queue = [QueueItem]()
        queue.append(QueueItem(node: root, min: Int.min, max: Int.max))
        var pointer = 0
        while pointer < queue.count {
            let queueItem = queue[pointer]
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

