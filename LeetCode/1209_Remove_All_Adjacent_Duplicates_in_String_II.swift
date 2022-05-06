class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        
        guard k > 1 else { return "" }
        
        var stack = [String]()
        for char in s {
            let cStr = String(char)
            if stack.count < k - 1 {
                stack.append(cStr)
            } else {
                var isMatch = true
                let lastIndex = stack.count - 1
                for i in 0..<k-1 {
                    if stack[lastIndex - i] != cStr {
                        isMatch = false
                        break
                    }
                }
                if isMatch {
                    stack.removeLast(k - 1)
                } else {
                    stack.append(cStr)
                }
            }
        }
        
        return stack.reduce("", +)
    }
}
