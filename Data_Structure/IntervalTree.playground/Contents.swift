import Foundation

/// Interval Tree
/// The idea is to augment a self-balancing Binary Search Tree (BST)
/// like `Red Black Tree` and `AVL Tree` to maintain set of intervals
/// so that all operations can be done in O(logN) time.
/// operations:
/// 1. Add an interval
/// 2. Remove an interval
/// 3. Given an interval x, find if x overlaps with any of the existing intervals.

///Every node of interval tree stores following information.
/// interval: (low: Int, high: Int) -> An interval which is represented as a pair (low, high)
/// max: Maximum high value in subtree rooted with this node.

/// e.g.
///
///                     [low:15, high:20, max: 40]
///                           /                  \
///        [low:10, high:30, max: 30]         [low:17, high:19, max: 40]
///               /           \                                 \
/// [low:5, high:20, max: 20]     [low:12, high:15, max: 15]                              [low:30, high:40, max: 40]
///

