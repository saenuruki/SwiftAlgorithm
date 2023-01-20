class Solution {

    struct Combination: Hashable {
        let nums: [Int]
        var key: String {
            nums.map({ String($0) }).reduce("", +)
        }

        static func == (lhs: Combination, rhs: Combination) -> Bool {
            return lhs.key == rhs.key
        }
    }

    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        
        // 1. Back Tracking to find all patterns.
        func backTracking(index: Int, currentNums: [Int]) -> [[Int]] {
            guard index < nums.count else { return [] }
            var output = [[Int]]()
            let newNums = currentNums + [nums[index]]
            if currentNums.count == 0 {
                output.append([nums[index]])            
                output += backTracking(index: index + 1, currentNums: newNums)
            } else if let lastNum = currentNums.last, lastNum <= nums[index] {
                output.append(newNums)
                if index < nums.count - 1 {
                    output += backTracking(index: index + 1, currentNums: newNums)
                }
            }
            if index < nums.count - 1 {
                output += backTracking(index: index + 1, currentNums: currentNums)
            }
            return output
        }

        // 2. Make the output uniqe
        let output = backTracking(index: 0, currentNums: []).map({ Combination(nums: $0 )} )
        let outputSet: Set<Solution.Combination> = Set(output)
        return outputSet.map({ $0.nums }).filter({ $0.count >= 2 })
    }
}
