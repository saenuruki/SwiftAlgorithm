class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        // 1. make hash map
        var hashMap = [Int: Int]() // key: num, value: the count
        for num in nums {
            hashMap[num, default: 0] += 1
        }
        
        // 2. make output
        var output = Set<[Int]>()
        output.insert([])
        for (key, value) in hashMap {
            var newOutput = Set<[Int]>()
            for count in 0...value {
                let newArray = Array(repeating: key, count: count)
                for subset in output {
                    newOutput.insert(subset + newArray)
                }
            }
            output = output.union(newOutput)
        }
        return Array(output)
    }
}

// Backtracking is Faster
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>()
        var comb = [Int]()
        
        subset(nums.sorted(), 0, &comb, &ans)
        return Array(ans)
    }
    
    
    func subset(_ nums: [Int], _ index: Int, _ comb: inout [Int], _ ans: inout Set<[Int]>) {
        if index >= nums.count {
            ans.insert(comb)
            
        } else {
            subset(nums, index+1, &comb, &ans)
            
            comb.append(nums[index])
            subset(nums, index+1, &comb, &ans)
            comb.removeLast()
        }
    }
}
