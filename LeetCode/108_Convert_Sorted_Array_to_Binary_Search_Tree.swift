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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        return sortedArrayToBST(nums, min: 0, max: nums.count - 1)
    }
    
    func sortedArrayToBST(_ nums: [Int], min: Int, max: Int) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        guard max - min > 0 else {
            return TreeNode(nums[max], nil, nil)
        }
        guard max - min > 1 else {
            let child = TreeNode(nums[min])
            return TreeNode(nums[max], child, nil)
        }
        
        let middleIndex = (max - min) / 2 + min
        let rightNode = sortedArrayToBST(nums, min: middleIndex + 1, max: max)
        let leftNode = sortedArrayToBST(nums, min: min, max: middleIndex - 1)
        return TreeNode(nums[middleIndex], leftNode, rightNode)
    }   
}
