class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var trusting = Array(repeating: 0, count: n)
        var trusted = Array(repeating: 0, count: n)
        for pear in trust {
            trusting[pear.first! - 1] += 1
            trusted[pear.last! - 1] += 1
        }

        // 2 conditions
        // The town judge trusts nobody.
        // Everybody (except for the town judge) trusts the town judge.
        var judges = [Int]()
        for i in 0..<n {
            if trusting[i] == 0 && trusted[i] == (n - 1) {
                judges.append(i + 1)
            }
        }
        return judges.count == 1 ? judges.first! : -1
    }
}
