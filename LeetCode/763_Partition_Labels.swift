class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        // create hashmap for detecting how many each letter
        var hashMap = [Character: Int]() // key: letter, value: count
        for char in s {
            if let count = hashMap[char] {
                hashMap[char] = count + 1
            } else {
                hashMap[char] = 1
            }
        }
        
        var fastPointer = 0
        var delayPointer = -1
        var output = [Int]()
        var currentPartitionSet = Set<Character>()
        
        for char in s {
            currentPartitionSet.insert(char)
            if let count = hashMap[char] {
                hashMap[char] = count - 1
            }
            if hashMap[char] == 0 {
                hashMap[char] = nil
                currentPartitionSet.remove(char)
                if currentPartitionSet.isEmpty {
                    // make pertition
                    output.append(fastPointer - delayPointer)
                    delayPointer = fastPointer
                }
            }
            fastPointer += 1
        }
        return output
    }
}
