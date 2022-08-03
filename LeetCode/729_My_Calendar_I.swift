class MyCalendar {

    var ranges: [Range<Int>]

    init() {
        ranges = [Range<Int>]()
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {        
        let newRange = start..<end
        for range in ranges where range.overlaps(newRange) {
            return false
        }
        ranges.append(newRange)
        return true
    }
}

