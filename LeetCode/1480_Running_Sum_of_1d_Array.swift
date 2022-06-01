class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var output = [Int]()
        for i in 0..<nums.count {
            let previousNum = output.isEmpty ? 0 : output.last!
            output.append(previousNum + nums[i])
        }
        return output
    }
}
