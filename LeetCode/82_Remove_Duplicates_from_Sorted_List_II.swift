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

// Time: O(N)
// Space: O(N)

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var output = ListNode()
        var outputPointer: ListNode? = output
        
        var tempNode: ListNode? = nil
        var headPointer = head
        
        while headPointer != nil {
            if tempNode?.val == headPointer?.val {
                while headPointer != nil && tempNode?.val == headPointer?.val {
                    headPointer = headPointer!.next
                }
                tempNode = nil
            } else {
                if tempNode != nil {
                    outputPointer?.next = tempNode
                    outputPointer = outputPointer!.next
                }
                tempNode = headPointer
                headPointer = headPointer!.next
            }
        }
        tempNode?.next = nil
        outputPointer?.next = tempNode
        return output.next
    }
}
