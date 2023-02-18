class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.left, root.right) = (root.right, root.left)
        _ = invertTree(root.right)
        _ = invertTree(root.left)
        return root
    }
}
