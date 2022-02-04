/// Check Subtree
/// T1 and T2 are two very large binary trees, with T1 much bigger than T2. Create an algorithm to determine if T2 is a subtree of T1
/// A tree T2 is a subtree of T1 if there exists a node n in T1 such that the subtree of n is identical to T2.
/// That is, if you cut off the tree at node n, the two trees would be identical.

import Foundation

// MARK: Solution 1
// time: O(m + n)
// space: O(m + n)
// -> m: the number of nodes in T1, n: the number of nodes in T2
func containsTree1(t1: TreeNode?, t2: TreeNode?) -> Bool {
    
    // convert tree into string of pre-order array
    let t1String = convertString(from: t1)
    let t2String = convertString(from: t2)
    
    return t1String.containsString(t2String)
}

func convertString(from node: TreeNode?) -> String {
    // Pre-Order Travarsal
    guard let node = node else { return "X" }
    let rootValue = "\(node.value)"
    let leftValue = convertString(from: node.left)
    let rightValue = convertString(from: node.right)
    return rootValue + leftValue + rightValue
}

// MARK: Solution 2
// time: O(m + kn)
// space: O(log(m) + log(n))
// -> m: the number of nodes in T1, n: the number of nodes in T2

func containsTree2(t1: TreeNode?, t2: TreeNode?) -> Bool {
    
    guard t2 != nil else { return true } // The empty tree is always a sbtree
    return findSubTree(t1, t2)
}

func findSubTree(_ r1: TreeNode?, _ r2: TreeNode?) -> Bool {
    if r1 == nil { return false } // big tree empty& subtree still not found
    if r1?.value == r2?.value, matchTree(r1, r2) { return true }
    return findSubTree(r1?.left, r2) || findSubTree(r1?.right, r2)
}

func matchTree(_ r1: TreeNode?, _ r2: TreeNode?) -> Bool {
    if r1 == nil && r2 == nil { return true } // nothing left in the subtree
    if r1 == nil || r2 == nil { return false } // exactly tree is empty, therefore trees don't match
    if r1?.value != r2?.value { return false } // data doesn't match
    return matchTree(r1?.left, r2?.left) && matchTree(r1?.right, r2?.right)
}



// MARK: TreeNode
struct TreeNode {
    let value: Int
    var right: TreeNode? = nil
    var left: TreeNode? = nil
}
