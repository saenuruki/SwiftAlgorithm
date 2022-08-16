class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let sArray = Array(s)
        var db = [Character: Int]()
        for i in 0..<sArray.count {
            db[sArray[i]] = db[sArray[i]] == nil ? i : -1
        }
        return db.filter({ $0.value != -1 }).map({ $0.value }).min() ?? -1
    }
}
