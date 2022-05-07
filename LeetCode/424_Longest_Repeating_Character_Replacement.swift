class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        
        // Sliding window
        var pointer = 0
        var counter = 0
        let words = Array(s)
        var output = 0
        
        for i in 0..<words.count {
            guard output < words.count - i + k else { break }
            pointer = i
            counter = 0
            let targetChar = words[pointer]
            while words[pointer] == targetChar || counter < k {
                if words[pointer] != targetChar { counter += 1 }
                pointer += 1
                if pointer == words.count { break }
            }
            let remainChangeCount = min(i, k - counter)
            output = max(output, pointer - i + remainChangeCount)
        }
        return output
    }
}
