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
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else { return nil }

        var count: Int = 0
        var pointer: ListNode? = head
        while pointer != nil {
            count += 1
            pointer = pointer?.next
        }        
        return sortedListToBST(head, count)
    }
    
    func sortedListToBST(_ head: ListNode?, _ count: Int) -> TreeNode? {
        guard count > 0 else { return nil }
        guard count > 1 else { return TreeNode(head!.val) }
        var middePosition = (count - 1) / 2
        var middlePointer: ListNode? = head
        while middlePointer != nil && middePosition != 0 {
            middlePointer = middlePointer?.next
            middePosition -= 1
        }
        var node = TreeNode(middlePointer!.val)
        node.left = sortedListToBST(head, (count - 1) / 2)
        node.right = sortedListToBST(middlePointer?.next, count - ((count - 1) / 2) - 1)
        return node
    }
}
