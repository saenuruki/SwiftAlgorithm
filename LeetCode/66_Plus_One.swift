class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        var newDigits = digits
        var pointer = digits.count - 1
        while pointer >= 0 {
            if digits[pointer] == 9 {
                newDigits[pointer] = 0
                pointer -= 1
            } else {
                newDigits[pointer] += 1
                break
            }
        }        
        return pointer == -1 ? [1] + newDigits : newDigits
    }
}
