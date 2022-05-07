// There are 2 solutions

// Check sorted words
// - Time: O(nlogn)
// - Space: O(1)
class Solution {
	func isAnagram(_ s: String, _ t: String) -> Bool {
		return s.sorted() == t.sorted()
	}
}

// Make Dictionary Table and compare the character step by step
// - Time: O(n)
// - Space: O(n)
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        var sDictionary = [Character: Int]() // key: the character, value: the count
        for sChar in s {
            let count = sDictionary[sChar, default: 0]
            sDictionary[sChar] = count + 1
        }
        
        for tChar in t {
            let count = sDictionary[tChar, default: 0]
            sDictionary[tChar] = count - 1
        }
        
        return sDictionary.values.filter({ $0 != 0 }).isEmpty
    }
}
