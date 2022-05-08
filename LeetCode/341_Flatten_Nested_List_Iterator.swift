/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {
    
    private var mainQueue: [Int]

    init(_ nestedList: [NestedInteger]) {
        
        var stack = nestedList
        mainQueue = [Int]()
        while !stack.isEmpty {
            
            let lastItem = stack.removeLast()
            if lastItem.isInteger() { 
                mainQueue = [lastItem.getInteger()] + mainQueue
            } else {
                stack += lastItem.getList()
            }
        }
    }
    
    func next() -> Int {
        let firtItem = mainQueue.first!
        mainQueue.removeFirst()
        return firtItem
    }
    
    func hasNext() -> Bool {
        return !mainQueue.isEmpty
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
