class BrowserHistory {

    var histories: [String]
    var currentPageIndex: Int

    init(_ homepage: String) {
        histories = [homepage]
        currentPageIndex = 0
    }
    
    func visit(_ url: String) {
        let totalHistoryCount = histories.count
        if totalHistoryCount > currentPageIndex + 1 {
            histories.removeLast(totalHistoryCount - currentPageIndex - 1)
        }
        histories.append(url)
        currentPageIndex += 1
    }
    
    func back(_ steps: Int) -> String {
        guard !histories.isEmpty else { return "" }
        if currentPageIndex - steps >= 0 {
            currentPageIndex -= steps
            return histories[currentPageIndex]
        } else {
            currentPageIndex = 0
            return histories.first!
        }
    }
    
    func forward(_ steps: Int) -> String {
        guard !histories.isEmpty else { return "" }
        if currentPageIndex + steps < histories.count {
            currentPageIndex += steps
            return histories[currentPageIndex]
        } else {
            currentPageIndex = histories.count - 1
            return histories.last!
        }
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */
