class Solution {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        var pigs = 0
        while pow(Double(minutesToTest / minutesToDie + 1), Double(pigs)) < Double(buckets) {
            pigs += 1
        }
        return pigs
    }
}
