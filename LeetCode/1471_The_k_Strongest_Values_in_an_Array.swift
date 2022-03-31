class Solution {
    func getStrongest(_ arr: [Int], _ k: Int) -> [Int] {
        var changableArray = arr
        let sortedArray = arr.sorted()
        let median = sortedArray[(arr.count - 1) / 2]
        changableArray.sort(by: { (a, b) -> Bool in 
            if abs(a - median) == abs(b - median) { return a > b }
            return abs(a - median) > abs(b - median)
        })
        return Array(changableArray[0...k-1])
    }
}
