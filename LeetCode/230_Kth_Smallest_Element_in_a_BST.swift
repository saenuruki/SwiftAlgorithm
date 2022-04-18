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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        let inOrderArray = makeInOrderArray(with: root)
        if inOrderArray.count < k { return 0 }
        return inOrderArray[k-1]
    }
    
    func makeInOrderArray(with node: TreeNode?) -> [Int] {
        guard let unwrappedNode = node else { return [] }
        let leftArray = makeInOrderArray(with: unwrappedNode.left)
        let rootValue = unwrappedNode.val
        let rightArray = makeInOrderArray(with: unwrappedNode.right)
        return leftArray + [rootValue] + rightArray
    }
}
