import UIKit
import Darwin

// Update modern Swift
// refer: https://www.hackingwithswift.com/articles/146/how-to-update-your-code-to-modern-swift


// 1. Converting between String and Data
// when you're switching between instances of String and Data. you might previously have used code like this

// old
let data = Data()
let old1 = String(data: data, encoding: .utf8)
let str = String()
let old2 = str.data(using: .utf8)
// The old method returned an optional string, so you needed to use nil coalescing to get the same behavior.

// new
let new1 = String(decoding: data, as: UTF8.self)
// That has the advantage of always returning a String instance, even if nothing could be decoded from the data.

// Similarly, going from a string to data also removes optionality and as a bonus is now much shorter.
let new2 = Data(str.utf8)


// 2. Hand-writen Equatable conformance
struct Person: Equatable {
    var name: String
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

// 3. Randomization and shuffling
// old
let oldRandom = arc4random_uniform(10)
// new
let newRandom = Int.random(in: 0...10)
let boolRandom = Bool.random()

// 6. #warning and #error directives
// FIXME: This needs to replaced next sprint
// It appear in Xcode's jump bar and help remind you to come back to some code later on.

#warning("This needs to replaced next sprint")
// This will add a build warning to your code at a particular location


// 8. Checking for the simulator
// If you search your project for #if (arch you might come across code like this:
#if (arch(i386) || arch(x86_64))
    // this is the simulator
#else
    // this is a real device
#endif

// targetEnvironment directive
#if targetEnvironment(simulator)
    // this is the simulator
#else
    // this is a real device
#endif
