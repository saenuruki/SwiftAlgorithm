class Solution {
    func minDeletions(_ s: String) -> Int {
        // 1. make hash map
        var hashMap = [Character: Int]()
        for char in s {
            hashMap[char, default: 0] += 1
        }
        
        // 2. transform it into array
        let maxCount = hashMap.values.max() ?? 0
        var memo = Array(repeating: 0, count: maxCount)
        for count in hashMap.values {
            memo[count - 1] += 1
        }

        // 3. delete characters
        var output = 0
        for i in stride(from: memo.count - 1, to: 0, by: -1) where memo[i] > 1 {
            let deleteCount = memo[i] - 1
            memo[i] = 1
            memo[i - 1] += deleteCount
            output += deleteCount
        }        
        output += memo[0] > 1 ? memo[0] - 1 : 0

        return output
    }
}
