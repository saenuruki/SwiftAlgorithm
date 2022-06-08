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

// Floyd's Algorithm for Cycle Detection
class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        guard head != nil && head?.next != nil else { return nil }
        
        // 1. find meetup node
        var slowPointer: ListNode? = head
        var fastPointer: ListNode? = head
        while fastPointer != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
            if slowPointer === fastPointer { break }
        }
        guard fastPointer != nil && fastPointer?.next != nil else { return nil } // it's not cycle
        
        // 2. find Entry point
        var headPointer: ListNode? = head
        while headPointer !== slowPointer {
            headPointer = headPointer?.next
            slowPointer = slowPointer?.next
        }
        
        return headPointer
    }
}
