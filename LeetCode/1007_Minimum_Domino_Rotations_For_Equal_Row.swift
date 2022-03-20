// Time: O(4N)
// Space: O(2N) 


class Solution {
    var dominoMap = [Int: Int]()

    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        for i in 0..<tops.count {
            if tops[i] != bottoms[i] { appendValue(with: bottoms[i]) }
            appendValue(with: tops[i])
        }
        let maxDomino = dominoMap.max(by: { a, b in a.value < b.value })!
        let isValidDomino = maxDomino.value == tops.count
        guard isValidDomino else { return -1 }
        let maxKey = maxDomino.key
        let topsKeyCount = tops.filter({ $0 == maxKey }).count
        let bottomsKeyCount = bottoms.filter({ $0 == maxKey }).count
        return tops.count - max(topsKeyCount, bottomsKeyCount)
    }

    func appendValue(with key: Int) {
        if let count = dominoMap[key] {
            dominoMap[key] = count + 1
        } else {
            dominoMap[key] = 1
        }
    } 
}
