class Solution {
    func minimumLength(_ s: String) -> Int {
        
        let sArray = Array(s) 
        var head = 0
        var tail = sArray.count - 1
        while head < tail {
            guard sArray[head] == sArray[tail] else { break }
            let target = sArray[head]
            while target == sArray[head] {
                head += 1
                guard head < tail else { break }
            }
            while  target == sArray[tail] {
                tail -= 1
                guard head < tail else { break }
            }
            
        }
        return tail - head + 1
    }
}
