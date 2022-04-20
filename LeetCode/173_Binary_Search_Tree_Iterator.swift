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

class BSTIterator {

    var stack = [TreeNode]()
    
    init(_ root: TreeNode?) {
        guard let root = root else { return }
        stack.append(root)
    }
    
    func next() -> Int {
        
        guard !stack.isEmpty else { return 0 }
        let latestNode = stack.removeLast()
        
        if var leftNode = latestNode.left { // has left
            stack.append(TreeNode(latestNode.val, nil, latestNode.right))
            while leftNode.left != nil { // repeat until reach the end of left
                stack.append(TreeNode(leftNode.val, nil, leftNode.right))
                leftNode = leftNode.left!
            }
            if let rightNode = leftNode.right {
                stack.append(rightNode)
            }
            return leftNode.val
        } else { // doesn't have left, then use self
            if let rightNode = latestNode.right {
                stack.append(rightNode)
            }
            return latestNode.val
        }
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
