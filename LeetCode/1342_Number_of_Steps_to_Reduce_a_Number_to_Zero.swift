class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var target = num
        var output = 0
        while target > 0 {
            if target % 2 == 0 {
                target /= 2
            } else {
                target -= 1
            }
            output += 1
        }
        return output
    }
}
