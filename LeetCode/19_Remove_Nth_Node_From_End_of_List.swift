/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        let output = ListNode(0)
        var fastPointer: ListNode? = output
        var delayPointer: ListNode? = output
        fastPointer?.next = head
        delayPointer?.next = head
        var diffCount = 0
        
        // loop until reaching the end node
        while fastPointer != nil {
            if diffCount <= n {
                diffCount = diffCount + 1
            } else {
                // start following after nth difference
                delayPointer = delayPointer?.next
            }
            fastPointer = fastPointer?.next
        }
        if diffCount < n { return output }
        delayPointer?.next = delayPointer!.next!.next
        
        return output.next
    }
}
