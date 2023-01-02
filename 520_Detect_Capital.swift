class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        let capitalCount = word.map({ $0.isUppercase ? 1 : 0 }).reduce(0, +)
        return capitalCount == word.count || 
            capitalCount == 0 ||
            (capitalCount == 1 && word.first?.isUppercase ?? false)
    }
}
