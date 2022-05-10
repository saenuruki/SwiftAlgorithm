class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var nums = Array(0...9)
        var res = [[Int]]()
        func dfs(_ value: Int, _ index: Int, _ array: [Int]) {
            if value == 0 && array.count == k {
                res.append(array)
                return
            } else if value <= 0 ||  array.count > k || index > 9 {
                return
            }
            
            for i in index...9 {
                if value - nums[i] < 0 { return }
                dfs(value - nums[i], i + 1, array + [nums[i]])
            }
        }
        dfs(n, 1, [])
        return res
    }
}
