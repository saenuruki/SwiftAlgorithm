class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // array to dictionary
        let dictionary = nums.reduce([Int: Int]()) { dic, num in
            var newDic = dic
            if let count = dic[num] {
                newDic[num] = count + 1
            } else {
                newDic[num] = 1
            }                                        
            return newDic                                             
        }
        
        guard dictionary.keys.count >= k else { return [] }
        
        // dictionary to tuple
        let tuples: [(num: Int, count: Int)] = dictionary.map { (num: $0.key, count: $0.value) }
        
        // sorted tuples
        let sortedTuples = tuples.sorted(by: { left, right in return left.count > right.count })
        
        let outputs = Array(sortedTuples[0..<k]).map { $0.num }
        return outputs
    }
}
