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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var input = head
        let output = ListNode()
        var pointer = output
        var cache = [Int: Bool]()
        
        while input != nil {
            if cache[input!.val] == nil {
                pointer.next = input!
                pointer = pointer.next!
                cache[input!.val] = true                
            }   
            input = input?.next
        }
        
        pointer.next = nil
        return output.next
    }
}
