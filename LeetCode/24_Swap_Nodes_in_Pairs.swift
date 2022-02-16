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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else { return head }
        
        let output = ListNode()
        var pointer: ListNode? = output
        pointer?.next = head
        
        // time: O(N/2)
        while pointer != nil { 
            let currentPointer = pointer
            guard let nextPointer = pointer?.next else { break }
            guard let nextNextPointer = nextPointer.next else { break }
            nextPointer.next = nextNextPointer.next
            nextNextPointer.next = nextPointer
            pointer?.next = nextNextPointer
            pointer = pointer!.next
            pointer = pointer!.next
        }
        
        return output.next
    }
}
