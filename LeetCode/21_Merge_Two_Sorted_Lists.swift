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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var input1 = list1
        var input2 = list2

        let output: ListNode = ListNode(0)
        var pointer = output
        while input1 != nil && input2 != nil {
            let v1 = input1!.val
            let v2 = input2!.val

            if v1 > v2 {
                pointer.next = input2!
                input2 = input2?.next
            } else {
                pointer.next = input1!
                input1 = input1?.next
            }
            pointer = pointer.next!
        }
        pointer.next = input1 ?? input2
        return output.next
    }
}
