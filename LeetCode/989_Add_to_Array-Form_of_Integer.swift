class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        let karray = String(k).compactMap({ Int(String($0)) })
        var output = [Int]()
        var increment = false
        for i in 0..<max(num.count, karray.count) {
            var newNum = 0
            if karray.count > i { newNum += karray[karray.count - 1 - i] }
            if num.count > i { newNum += num[num.count - 1 - i] }
            if increment { newNum += 1 }            
            increment = newNum / 10 == 1
            newNum %= 10
            output.append(newNum)
        }
        if increment { output.append(1) }            
        return output.reversed()
    }
}
