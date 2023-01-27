class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        
        struct WordDict {
            let word: String
            let chars: [String]
        }
        let wordDicts = words.map({ WordDict(word: $0, chars: Array($0).map({ String($0) })) })


        var output = Set<String>()
        func dfs(with wordDict: WordDict) {
            for i in 0..<wordDicts.count 
                where wordDict.chars.count >= wordDicts[i].word.count &&
                wordDict.chars.last! == wordDicts[i].chars.last! {
                guard wordDict.word != wordDicts[i].word else { return }
                if wordDict.chars.reduce("", +) == wordDicts[i].word {
                    output.insert(wordDict.word)
                } else if wordDict.chars.suffix(wordDicts[i].word.count).reduce("", +) == wordDicts[i].word {
                    dfs(with: WordDict(word: wordDict.word, chars: wordDict.chars.dropLast(wordDicts[i].word.count)))
                }
            }
        }

        for i in 0..<wordDicts.count {
            dfs(with: wordDicts[i])
        }
        return Array(output)
    }
}
