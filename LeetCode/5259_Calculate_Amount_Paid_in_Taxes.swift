class Solution {
    func calculateTax(_ brackets: [[Int]], _ income: Int) -> Double {
        
        var remain = income
        var totalTax: Double = 0
        var previousUpper = 0
        for bracket in brackets {
            guard remain > 0 else { break }
            let upper = bracket[0]
            let percent = bracket[1]
            let targetMoney = min(upper - previousUpper, remain)
            totalTax += Double(targetMoney * percent) / 100
            remain -= targetMoney
            previousUpper = upper
        }

        return totalTax
    }
}
