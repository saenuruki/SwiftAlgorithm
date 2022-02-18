class Solution {
    func isValid(_ s: String) -> Bool {
        
        var stack = [Character]()
        for char in s {
            switch char {
            case "(", "{", "[":
                stack.append(char)
            case ")":
                guard !stack.isEmpty, stack.last! == "(" else { return false }
                stack.removeLast()
            case "}":
                guard !stack.isEmpty, stack.last! == "{" else { return false }
                stack.removeLast()
            case "]":
                guard !stack.isEmpty, stack.last! == "[" else { return false }
                stack.removeLast()
             default:
                return false
            }
        }
        
        return stack.isEmpty
    }
}
