class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        guard height.count > 2 else { return min(height[0], height[1]) * 1}
        var start = 0
        var end = height.count - 1
        var output = 0
        while start < end {
            output = max(output, min(height[start], height[end]) * (end - start))
            if height[start] == height[end] {
                let maxIndex = lookupLargestNumIndex(with: height, start: start, end: end)
                if maxIndex == start || maxIndex == end { return output }
                if maxIndex - start > end - maxIndex {
                    end = end - 1
                } else {
                    start = start + 1
                }
            } else if height[start] > height[end] {
                end = end - 1
            } else {
                start = start + 1
            }
        }
        return output
    }

    func lookupLargestNumIndex(with height: [Int], start: Int, end: Int) -> Int {
        var max = 0
        var maxIndex = 0
        for i in start...end{
            if max <= height[i] {
                max = height[i]
                maxIndex = i
            }
        }
        return maxIndex
    }
}
