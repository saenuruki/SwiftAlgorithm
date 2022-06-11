// BackTracking
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        return dfs(nums, [])
    }
    
    func dfs(_ nums: [Int], _ stack: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [stack] }
        var usedSet = Set<Int>()
        var thisStack = stack
        var thisNums = nums
        var output = [[Int]]()
        for i in 0..<nums.count {
            guard !usedSet.contains(nums[i]) else { continue }
            thisStack.append(nums[i])
            thisNums.remove(at: i)
            output += dfs(thisNums, thisStack)
            
            usedSet.insert(nums[i])
            thisNums.insert(nums[i], at: i)
            thisStack.removeLast()
        }
        
        return output
    }
}

