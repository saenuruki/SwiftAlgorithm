class Solution {
    func countBits(_ n: Int) -> [Int] {
        
        var output = [Int]()
        for i in 0...n {
            output.append(Array(String(i, radix: 2)).filter({ $0 == "1" }).count)
        }
        return output
    }
}
