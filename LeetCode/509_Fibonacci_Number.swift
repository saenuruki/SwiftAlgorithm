class Solution {
    var cache = [Int: Int]()
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        if let cached = cache[n] {
            return cached
        } else {
            let output = fib(n - 1) + fib(n - 2)
            cache[n] = output
            return output
        }
    }
}
