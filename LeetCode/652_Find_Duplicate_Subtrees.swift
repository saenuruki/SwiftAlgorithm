class Solution {
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        guard let root = root else { return [] }
        var visited = [String: (node: TreeNode, duplicated: Bool)]()
        func dfs(_ root: TreeNode?) -> String {
            guard let root = root else { return "" }
            let key = "\(root.val)-{" + dfs(root.left) + "}-{" + dfs(root.right) + "}"
            visited[key] = (node: root, duplicated: visited[key] != nil)
            return key
        }
        _ = dfs(root)

        return visited.filter({ $0.value.duplicated }).map({ $0.value.node })
    }
}
