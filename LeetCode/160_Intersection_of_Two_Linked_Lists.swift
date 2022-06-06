/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        // 1. count each list length
        let lengthA = calcLength(headA) // Time: O(A) 
        let lengthB = calcLength(headB) // Time: O(B)
        
        
        // 2. move same length
        var pointerA: ListNode? = headA
        var pointerB: ListNode? = headB
        if lengthA > lengthB {
            for _ in 0..<(lengthA - lengthB) { // Time: O(A - B)
                pointerA = pointerA?.next
            }
        } else if lengthA < lengthB {
            for _ in 0..<(lengthB - lengthA) { // Time: O(B - A)
                pointerB = pointerB?.next
            }
        }
        
        // 3. check when it is same node
        var output: ListNode?
        while pointerA != nil && pointerB != nil { // Time: O(A or B)
            
            if pointerA === pointerB && output == nil { 
                output = pointerA
            }
            if pointerA?.val != pointerB?.val && output != nil { 
                return nil
            }
            
            pointerA = pointerA?.next
            pointerB = pointerB?.next
        }
        return output
    }
   
    func calcLength(_ head: ListNode?) -> Int {
        var pointer = head
        var count = 0
        while pointer != nil {
            count += 1
            pointer = pointer?.next
        }
        return count
    }
}
