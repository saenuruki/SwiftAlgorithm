// Time: O(t * n) -> t: tempDP size, n: nums size
// Space: O(2 * t) -> t: tempDP size

class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var dp = [Int: Int]()
        dp[0] = 1
        
        for num in nums {
            var tempDP = [Int: Int]()
            for memo in dp {
                tempDP[memo.key + num, default: 0] += memo.value
                tempDP[memo.key - num, default: 0] += memo.value
            }
            dp = tempDP
        }
        
        return dp[target] ?? 0
    }
}
