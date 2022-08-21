class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count >= 4 && s.count <= 12 else { return [] }
        guard s.allSatisfy({ $0.isNumber }) else { return [] }
        let sArray = Array(s)
        
        var ips = [String]()
        for i in 0..<3 {
            for j in (i + 1)..<(i + 4) where j < s.count {
                for k in (j + 1)..<(j + 4) where k < s.count - 1 {
                    let result = sArray.getValidIP(i, j, k)
                    guard result.isValid else { continue }
                    ips.append(result.ip)
                }
            }
        }
        return ips
    }
}

extension Array where Element == Character {
    func getValidIP(_ i: Int, _ j: Int, _ k: Int) -> (isValid: Bool, ip: String) {
        guard !(self[0] == "0" && i != 0) else { return (isValid: false, ip: "") }
        guard !(self[i+1] == "0" && j - i != 1) else { return (isValid: false, ip: "") }
        guard !(self[j+1] == "0" && k - j != 1) else { return (isValid: false, ip: "") }
        guard !(self[k+1] == "0" && self.count - k != 2) else { return (isValid: false, ip: "") }
        guard 
            let firstNum = Int(String(self[...i])),
            let secondNum = Int(String(self[(i+1)...j])),
            let thirdNum = Int(String(self[(j+1)...k])),
            let forthNum = Int(String(self[(k+1)...]))
        else { return (isValid: false, ip: "") }
        guard 
            firstNum >= 0 && firstNum <= 255,
            secondNum >= 0 && secondNum <= 255,
            thirdNum >= 0 && thirdNum <= 255,
            forthNum >= 0 && forthNum <= 255
        else { return (isValid: false, ip: "") }
        let ip = "\(firstNum).\(secondNum).\(thirdNum).\(forthNum)"
        return (isValid: true, ip: ip)
    }
}
