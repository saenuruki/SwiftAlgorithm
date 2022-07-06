class Solution {
    var cache = [Int: Int]()
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        } else {
            let output = fib(n - 1) + fib(n - 2)
            cache[n] = output
            return output
        }
    }
}
