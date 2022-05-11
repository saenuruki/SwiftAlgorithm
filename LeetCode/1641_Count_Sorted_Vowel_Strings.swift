class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var a = 1
        var e = 1
        var i = 1
        var o = 1
        var u = 1

        var count = 1
        while count < n {
            u += a + e + i + o
            o += a + e + i
            i += a + e
            e += a
            count += 1
        }
        
        return a + e + i + o + u
    }
}
