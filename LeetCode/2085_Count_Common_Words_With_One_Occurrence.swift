class Solution {
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var output = [String: Int]() // key: word, value: count
        for word in words1 {
            if let value = output[word] {
                output[word] = value + 1
            } else {
                output[word] = 1
            }
        }
        output = output.filter { $0.value == 1 }
        for word in words2 {
            if let value = output[word] {
                output[word] = value + 1
            }
        }
        return output.values.filter({ $0 == 2 }).count
    }
}
