class Solution {
    func partition(_ s: String) -> [[String]] {
        var output = [[String]]()
        var candidate = [String]()
        backtrack(output: &output, candidate: &candidate, start: 0, target: s)
        return output
    }
    
    func backtrack(output: inout [[String]], candidate: inout [String], start: Int, target: String) {
        if start == target.count { output.append(candidate); return }
        
        for i in start..<target.count {
            let startIndex = target.index(target.startIndex, offsetBy: start)
            let endIndex = target.index(target.startIndex, offsetBy: i)
            let str = String(target[startIndex...endIndex])
            
            if str.isPalindrome {
                candidate.append(str)
                backtrack(output: &output, candidate: &candidate, start: i + 1, target: target)
                candidate.removeLast()
            }
        }
    }
}

extension String {
    var isPalindrome: Bool {
        let chars = Array(self)
        return self == String(chars.reversed())
    }
}
