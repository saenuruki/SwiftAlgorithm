//
//  LeetCode.swift
//  TestPractice
//
//  Created by 塗木冴 on 2022/08/11.
//

import Foundation

// No.98
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

struct QueueItem {
    let node: TreeNode
    let min: Int
    let max: Int
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var queue = [QueueItem]()
        queue.append(QueueItem(node: root, min: Int.min, max: Int.max))
        var pointer = 0
        while pointer < queue.count {
            let queueItem = queue[pointer]
            if let leftNode = queueItem.node.left {
                guard leftNode.val > queueItem.min && leftNode.val < queueItem.node.val
                else { return false }
                
                queue.append(QueueItem(node: leftNode, min: queueItem.min, max: queueItem.node.val))
            }
            if let rightNode = queueItem.node.right {
                guard rightNode.val > queueItem.node.val && rightNode.val < queueItem.max
                else { return false }
                queue.append(QueueItem(node: rightNode, min: queueItem.node.val, max: queueItem.max))
            }
            pointer += 1
        }
        return true
    }
    
    func longestSubarray(_ nums: [Int]) -> Int {
        let zeros = nums.filter({ $0 == 0 })
        guard zeros.count != nums.count else { return 0 } // all 0
        guard !zeros.isEmpty else { return nums.count - 1 } // all 1
        
        var dp1 = Array(repeating: 0, count: nums.count)
        var dp2 = Array(repeating: 0, count: nums.count)
        dp1[0] = nums[0]
        dp2[0] = nums[0]
        for i in 1..<nums.count {
            if nums[i] == 0 {
                dp1[i] = 0
                dp2[i] = dp1[i - 1]
            } else { // == 1
                dp1[i] = dp1[i - 1] + 1
                dp2[i] = dp2[i - 1] + 1
            }
        }
        return dp2.max() ?? 0
    }
    
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {

        func isValid(upTo upper: Int) -> Bool {
            var count = 0
            for num in time where num <= upper {
                count += upper / num
            }
            return count >= totalTrips
        }
        
        var (low, high) = (1, (time.min() ?? 1) * totalTrips)
        var result = 0
        while low <= high {
            let middle = (high - low) / 2 + low
            if isValid(upTo: middle) {
                result = middle
                high = middle - 1
            } else {
                low = middle + 1
            }
        }
        return result
    }
    
    
    // "1+  1"
    // "2+ (3 *2 - 4) - 1"
    func calcurateFormula(_ formula: String) -> Int {
        let fixedFormula = Array(formula.replacingOccurrences(of: " ", with: "")).map({ String($0) })
        guard fixedFormula.count > 0 else { return 0 }
        var numStack = [Int]()
        var opeStack = [Operator]()
        
        // 1. Making Stacks
        var skipIndex = -1
        for i in 0..<fixedFormula.count where i > skipIndex {
            let item = fixedFormula[i]
            if let num = Int(item) {
                if i >= 1, let previous = Int(fixedFormula[i - 1]) {
                    let lastNum = numStack.removeLast()
                    numStack.append(10 * lastNum + num)
                } else {
                    numStack.append(num)
                }
            } else if let oper = Operator(rawValue: item) {
                if oper == .openParenthesis {
                    var pointer = i + 1
                    var openCount = 1
                    while pointer < fixedFormula.count,
                        !(fixedFormula[pointer] == Operator.closeParenthesis.rawValue &&
                        openCount <= 1) {
                        if fixedFormula[pointer] == Operator.openParenthesis.rawValue { openCount += 1 }
                        if fixedFormula[pointer] == Operator.closeParenthesis.rawValue { openCount -= 1 }
                        pointer += 1
                    }
                    let num = calcurateFormula(fixedFormula[(i+1)..<pointer].reduce("", +))
                    numStack.append(num)
                    skipIndex = pointer
                } else {
                    opeStack.append(oper)
                }
            }
        }
        
        // 2. Calcurate high priority
        guard numStack.count == opeStack.count + 1 else { return -1 } // error
        var newNumStack: [Int] = [numStack[0]]
        var newOpeStack = [Operator]()
        for i in 0..<opeStack.count {
            if opeStack[i].isHighPriority {
                let num = opeStack[i].calc(newNumStack.last!, numStack[i + 1])
                newNumStack[newNumStack.count - 1] = num
            } else {
                newNumStack.append(numStack[i + 1])
                newOpeStack.append(opeStack[i])
            }
        }
        
        // 3. Calcurate low priority
        guard newNumStack.count == newOpeStack.count + 1 else { return -1 } // error
        var output = newNumStack[0]
        for i in 0..<newOpeStack.count {
            output = newOpeStack[i].calc(output, newNumStack[i + 1])
        }
        return output
    }
    
    enum Operator: String {
        case plus = "+"
        case minus = "-"
        case multiple = "*"
        case devide = "/"
        case openParenthesis = "("
        case closeParenthesis = ")"
        
        var isHighPriority: Bool {
            switch self {
            case .multiple, .devide: return true
            case .plus, .minus, .openParenthesis, .closeParenthesis: return false
            }
        }
        
        func calc(_ a: Int, _ b: Int) -> Int {
            switch self {
            case .plus: return a + b
            case .minus: return a - b
            case .multiple: return a * b
            case .devide: return a / b
            default: return -1 // error
            }
        }
    }
}

