class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp = Array(repeating: -1, count: target + 1)
        dp[0] = 1
        return dfs(nums, target, &dp)
    }
    
    func dfs(_ nums: [Int], _ target: Int, _ dp: inout [Int]) -> Int {
        guard dp[target] == -1 else { return dp[target] }
        var result = 0
        for i in 0..<nums.count where target >= nums[i] {
            result += dfs(nums, target - nums[i], &dp)
        }
        dp[target] = result
        return result
    }
}

