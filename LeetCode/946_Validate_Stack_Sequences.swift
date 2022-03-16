// Time: O(2N)
// Space: O(N)

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        guard pushed.count == popped.count else { return false }
        guard pushed.count > 0 else { return true }
        
        var stack = [Int]()
        var pushedPointer = 0
        var poppedPointer = 0
        stack.append(pushed[pushedPointer])
        pushedPointer += 1
        
        while stack.count > 0 {
            while stack.last == popped[poppedPointer] {
                stack.removeLast()
                poppedPointer += 1
                if stack.count == 0 { break }
                if poppedPointer == popped.count { return stack.count == 0 }
            }
            
            guard pushedPointer < pushed.count else { break }
            stack.append(pushed[pushedPointer])
            pushedPointer += 1
        }
        
        return stack.count == 0
    }
}
