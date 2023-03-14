class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        func dfs(_ root: TreeNode, _ num: Int) -> [Int] {
            let newNum = 10 * num + root.val
            if root.left == nil && root.right == nil { return [newNum] }
            let leftNums = root.left == nil ? [] : dfs(root.left!, newNum)
            let rightNums = root.right == nil ? [] : dfs(root.right!, newNum)
            return leftNums + rightNums
        }
        return dfs(root, 0).reduce(0, +)
    }
}
