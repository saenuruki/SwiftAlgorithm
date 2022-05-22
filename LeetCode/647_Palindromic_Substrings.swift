class Solution {
    func countSubstrings(_ s: String) -> Int {
        
        var stack = [Character]()
        let inputSArray = Array(s)
        var output = s.count
        for i in 0..<inputSArray.count {
            let char = inputSArray[i]
            if stack.count > 0, stack.last! == char { 
                output += countPalindrome(inputSArray, i, false)
            }
            if stack.count > 1, stack[i - 2] == char {
                output += countPalindrome(inputSArray, i, true)
            }
            stack.append(char)
        }
        return output 
    }
    
    func countPalindrome(_ input: [Character], _ startIndex: Int, _ isOdd: Bool) -> Int {
        var forwardPointer = startIndex
        var rewindPointer = isOdd ? startIndex - 2 : startIndex - 1
        var output = 0
        while forwardPointer < input.count && rewindPointer >= 0 {
            guard input[forwardPointer] == input[rewindPointer] else { break }
            output += 1
            forwardPointer += 1
            rewindPointer -= 1
        }
        
        return output
    }
}
