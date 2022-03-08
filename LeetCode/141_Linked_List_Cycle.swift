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

// Time: O(N)
// Space: O(1)

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {

        var cacheSet = Set<Int>()
        var pointer = head
        while pointer != nil {
            if pointer!.val > 100000 {
                return true
            }
            pointer?.val = pointer!.val + 200001
            pointer = pointer?.next
        }
        return false
    }
}
