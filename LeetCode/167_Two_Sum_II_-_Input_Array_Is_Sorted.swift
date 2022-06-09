iclass Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else { return [] }
        
        var memo = [Int: Int]() // key: num, value: the index
        for i in 0..<numbers.count {
            let num = numbers[i]
            if let firstIndex = memo[num] {
                return [firstIndex + 1, i + 1]
            } else {
                memo[target - num] = i
            }
        }
        return []
    }
}


// Sortされているため、左右からハサミ打つことが可能！
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i=0, j=numbers.count-1
        while i<j {
            let sum = numbers[i] + numbers[j]
            if sum == target {
                return [i+1,j+1]
            } else if sum<target {
                i += 1
            } else {
                j -= 1
            }
        }
        return []
    }
}
