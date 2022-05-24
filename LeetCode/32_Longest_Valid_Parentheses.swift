class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        
        var value = 0, start = 0, stack = [Int]()
        
        for (i,ch) in s.enumerated() {
            switch ch == "(" {
            case true:
                stack.append(i)
            default:
                if !stack.isEmpty {
                    stack.removeLast()
                    if let last = stack.last {
                        value = max(value, i - last)
                    } else {
                        value = max(value, i - start + 1)
                    }
                } else {
                    start = i + 1
                }
            }
        }
        return value
    }
}

