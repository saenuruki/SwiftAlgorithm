class MyHashSet {

    var keys = Set<Int>()

    init() {
        
    }
    
    func add(_ key: Int) {
        keys.insert(key)
    }
    
    func remove(_ key: Int) {
        keys.remove(key)
    }
    
    func contains(_ key: Int) -> Bool {
        return keys.contains(key)
    }
    
    func hash(with key: Int) -> Int {
        
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
