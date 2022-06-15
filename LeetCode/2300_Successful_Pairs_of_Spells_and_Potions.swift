class Solution {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        
        var n = spells.count, m = potions.count, j = m - 1
        var res = [Int](Array(repeating: 0, count: n))
        var potionsSorted = potions.sorted(), spellSorted = spells.sorted()
        
        var count = [Int:Int]()
        
        for i in 0..<n {
            while (j >= 0 && spellSorted[i] * potionsSorted[j] >= success) {
                j -= 1
            }
            count[spellSorted[i]] = m - j - 1
        }
        
        for i in 0..<n {
            res[i] = count[spells[i]]!
        }

        return res
    }
}
