class WordFilter {
    var dict = [[String]:Int]()
    init(_ words: [String]) { 
        for (index,w) in words.enumerated() { //O(word.len! * words.len)
            let wArr = Array(w)
            for i in 0..<wArr.endIndex {
                let prefix = String(wArr[0...i])
                for j in 0..<wArr.endIndex {
                    let suffix = String(wArr[j..<wArr.endIndex])
                    dict[[prefix,suffix]] = index
                }
            }
        }
    }

    func f(_ prefix: String, _ suffix: String) -> Int { // O(1)
        if let index = dict[[prefix,suffix]] {
            return index
        }
        return -1
    }
}

/**
 * Your WordFilter object will be instantiated and called as such:
 * let obj = WordFilter(words)
 * let ret_1: Int = obj.f(prefix, suffix)
 */
