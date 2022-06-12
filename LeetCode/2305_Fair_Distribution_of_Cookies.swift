class Solution {
  
  var result = Int.max
  
  func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
    var child = Array(repeating: 0, count: k)
    recursive(cookies, child, 0, k)
    return result
  }
  
  func recursive(_ cookies: [Int], _ child: [Int], _ currentIndex: Int, _ k: Int) {
    guard currentIndex < cookies.count else {
      result = min(result, child.max() ?? Int.max)
      return
    }
    for i in 0..<k {
      var newChild = child
      newChild[i] += cookies[currentIndex]
      recursive(cookies, newChild, currentIndex + 1, k)
    } 
  }
}
