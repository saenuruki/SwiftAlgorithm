class Solution {
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        var sum = 0
        var dict = [0: -1]
        for i in arr.indices {
            sum += arr[i]
            dict[sum] = i
        }

        sum = 0
        var result = Int.max
        var leftLength = Int.max
        for i in arr.indices {
            sum += arr[i]

            if let leftIndex = dict[sum - target] {
                leftLength = min(leftLength, i - leftIndex)
            }

            if let rightIndex = dict[sum + target], leftLength < Int.max {
                result = min(result, rightIndex - i + leftLength)
            }
        }

        return result == Int.max ? -1 : result
    }
}
