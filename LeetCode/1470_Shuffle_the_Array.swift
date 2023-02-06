class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        
        var output = [Int]()
        for i in 0..<n {
            output.append(nums[i])
            output.append(nums[n + i])
        }
        return output
    }
}
