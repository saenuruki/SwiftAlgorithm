class Solution {
    func validPalindrome(_ s: String) -> Bool {
        // isPalindrome without deleting a character
        guard s != String(s.reversed()) else { return true } 
        
        // isPalindrome with deleting at most one character
        let sArray = Array(s)
        var headPointer = 0
        var tailPointer = sArray.count - 1
        var possibleSkip = true
        
        while headPointer < tailPointer {
            if sArray[headPointer] != sArray[tailPointer] { 
                if possibleSkip {
                    possibleSkip = false
                    
                    guard tailPointer - headPointer > 1 else { return true }
                    let removeHeadArray = sArray[headPointer+1...tailPointer]
                    let removeTailArray = sArray[headPointer...tailPointer-1]
                    
                    return String(removeHeadArray) == String(removeHeadArray.reversed()) || String(removeTailArray) == String(removeTailArray.reversed())
                }
            }
            headPointer += 1
            tailPointer -= 1
        }
        return true
    }
}
