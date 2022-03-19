
class FreqStack {
    
    var stack = [Int: [Int]]() // key: num, value: freqStack
    var memory = [Int: Int]() // key: num, value: count

    init() { }
    
    func push(_ val: Int) {
        if let count = memory[val] {
            memory[val] = count + 1
        } else {
            memory[val] = 1
        }
        if let freqStack = stack[memory[val]!] {
            stack[memory[val]!] = freqStack + [val]
        } else {
            stack[memory[val]!] = [val]
        }
    }
    
    func pop() -> Int {
        let freqKey = stack.keys.max()!
        let poppedNum = stack[freqKey]!.removeLast()
        if let count = memory[poppedNum] {
            memory[poppedNum] = count - 1
        }
        if stack[freqKey] == [] {
            stack[freqKey] = nil
        }
        return poppedNum
    }
}

/**
 * Your FreqStack object will be instantiated and called as such:
 * let obj = FreqStack()
 * obj.push(val)
 * let ret_2: Int = obj.pop()
 */
