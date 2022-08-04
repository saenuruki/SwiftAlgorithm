class Solution {
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        
        var pointer = q
        var counter = 1
        while pointer % p != 0 {
            pointer += q
            counter += 1
        } 
        
        if (pointer / p) % 2 == 0 {
            return 0
        } else if counter % 2 == 0 {
            return 2
        } else {
            return 1
        }
    }
}
