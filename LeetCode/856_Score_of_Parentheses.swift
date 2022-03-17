class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
        
        var stack = [Int]()
        var score = 0
        let sArray = Array(s).map({ String($0)} )
        for i in 0..<sArray.count {
            if sArray[i] == "(" {
                stack.append(score)
                score = 0
            } else {
                let top = stack.removeLast()
                score = top + max(2 * score, 1)
            }
        }
        return score
    }
}
