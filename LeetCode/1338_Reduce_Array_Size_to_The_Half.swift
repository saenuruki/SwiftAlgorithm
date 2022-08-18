class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        // create hash map
        var hashMap = [Int: Int]()
        for num in arr {
            hashMap[num, default: 0] += 1
        }
        
        let sortedArr = hashMap.sorted(by: { $0.value > $1.value }).map({ $0.key })
        var size = 0
        var count = 0
        for num in sortedArr {
            guard count + hashMap[num]! < (arr.count / 2) else { return size + 1 }
            size += 1
            count += hashMap[num]!
        }
        return size
    }
}
