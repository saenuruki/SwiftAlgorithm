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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil { return nil }
        
        return addTwoNumbers(l1, l2, false)
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, _ requreiedIncrement: Bool) -> ListNode? {
        if l1 == nil && l2 == nil { 
            if requreiedIncrement {
                return ListNode(1, nil)
            } else { 
                return nil
            }
        }
        let node1Value = l1?.val ?? 0
        let node2Value = l2?.val ?? 0
        let increment = requreiedIncrement ? 1 : 0
        let value = (node1Value + node2Value + increment) % 10
        let nextRequreiedIncrement = (node1Value + node2Value + increment) / 10 >= 1
        let nextNode = addTwoNumbers(l1?.next, l2?.next, nextRequreiedIncrement)
        
        return ListNode(value, nextNode)
    }
}
