class Solution {    
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [[String]](repeating: [], count: n + 1)
        res[0] = [""]
        for i in 1...n {
            for j in 0..<i {
                for s1 in res[j] {
                    for s2 in res[i-j-1] {
                        res[i].append("(" + s1 + ")" + s2)
                    }
                }
            }
        }
        return res.last!
    }
}
