import Foundation
class Solution {
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        
        var primeCache = [Int: Bool]() // num: isCache
        var output = 0
        for num in stride(from: left, through: right, by: 1) {
            let ones = String(num, radix: 2).filter({ $0 == "1" }).count
            if primeCache[ones] == nil { primeCache[ones] = isPrime(ones) }
            if primeCache[ones] ?? false { output += 1 }
        }
        return output
    }
    
    
    func isPrime(_ num: Int) -> Bool {
        guard num > 1 else { return false }
        if num == 2 || num == 3 { return true }
        guard num % 2 != 0 && num % 3 != 0 else { return false }
        
        for i in 2..<Int(sqrt(Double(num))) {
            if num % i == 0 { return false }
        }
        return true
    }
}
