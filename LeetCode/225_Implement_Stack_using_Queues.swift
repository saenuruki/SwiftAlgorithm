
class MyStack {

    private var elements: [Int]
    
    init() {
        elements = [Int]()
    }
    
    func push(_ x: Int) {
        elements.append(x)
    }
    
    func pop() -> Int {
        return elements.removeLast()
    }
    
    func top() -> Int {
        return elements.last ?? 0
    }
    
    func empty() -> Bool {
        return elements.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
