//Cocoa Design Patterns
//Adopt and interoperate with Cocoa design patterns in your Swift apps.
// https://developer.apple.com/documentation/swift/cocoa-design-patterns

//Topics
//Common Patterns
// 1. Using Key-Value Observing in Swift
//    Notify objects about changes to the properties of other objects.
// 2. Using Delegates to Customize Object Behavior
//    Respond to events on behalf of a delegator.
// 3. Managing a Shared Resource Using a Singleton
//    Provide access to a shared resource using a single, shared class instance.
// 4. About Imported Cocoa Error Parameters
//    Learn how Cocoa error parameters are converted to Swift throwing methods.
// 5. Handling Cocoa Errors in Swift
//    Throw and catch errors that use Cocoa’s error types.


// 1. Using Key-Value Observing in Swift
// Notify objects about changes to the properties of other objects.
// https://developer.apple.com/documentation/swift/using-key-value-observing-in-swift

//What is key-value observing?
//Swift version: 5.6
//
//Paul Hudson     @twostraws    May 28th 2019
//Key-value observing is the ability for Swift to attach code to variables, so that whenever the variable is changed the code runs. It’s similar to property observers (willSet and didSet ), except KVO is for adding observers outside of the type definition.
//
//KVO isn’t terribly nice in pure Swift code, because it relies on the Objective-C runtime – you need to use @objc classes that inherit from NSObject, then mark each of your properties with @objc dynamic.
//
//For example, we could create a Person class like this:
import UIKit

@objc class Person: NSObject {
    @objc dynamic var name = "Taylor Swift"
}

let taylor = Person()

//You could then observe that user’s name changing like this:
taylor.observe(\Person.name, options: .new) { person, change in
    print("I'm now called \(person.name)")
}

//That asks Swift to watch for new values coming in, then prints the person’s name as soon as the new value is set.
//
//To try it out, just change the person’s name to something else:
taylor.name = "Justin Bieber"

//That will print “I’m now called Justin Bieber.”
//
//Although KVO is unpleasant in pure Swift code, it’s better when working with Apple’s own APIs – they are all automatically both @objc and dynamic because they are written in Objective-C.
//
//However, one warning: even though large parts of UIKit might work with KVO, this is a coincidence rather than a promise – Apple make no guarantees about UIKit remaining KVO-compatible in the future.

// 2. Using Delegates to Customize Object Behavior
//    Respond to events on behalf of a delegator.
// https://developer.apple.com/documentation/swift/using-delegates-to-customize-object-behavior



// 3. Managing a Shared Resource Using a Singleton
//    Provide access to a shared resource using a single, shared class instance.
// https://developer.apple.com/documentation/swift/managing-a-shared-resource-using-a-singleton
//
//Overview
//You use singletons to provide a globally accessible, shared instance of a class. You can create your own singletons as a way to provide a unified access point to a resource or service that’s shared across an app, like an audio channel to play sound effects or a network manager to make HTTP requests.
//
//Create a Singleton
//You create simple singletons using a static type property, which is guaranteed to be lazily initialized only once, even when accessed across multiple threads simultaneously:

class ElonMask {
    static let shared = ElonMask()
}


