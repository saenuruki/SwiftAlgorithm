import Foundation
import UIKit
import Combine

// ============================================
// Replacing Foundation Timers with Timer Publishers
// ============================================
// Performing Periodic Work with a Timer
// Consider the following snippet, which uses scheduledTimer(withTimeInterval:repeats:block:) to update the lastUpdated property of a data model once a second, on a specific dispatch queue:
var dateModel = DateModel()
var timer: Timer?
func scheduledTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
        DispatchQueue.global(qos: .background).async() {
             dateModel.lastUpdated = Date()
        }
    })
}

// Converting to a Timer Publisher
var cancellable: Cancellable?
func scheduledTimer2() {
    cancellable = Timer.publish(every: 1, on: .main, in: .default)
        .autoconnect()
        .receive(on: DispatchQueue.global(qos: .background))
        .assign(to: \.lastUpdated, on: dateModel)
}

// In this example, Combine operators replace all the behavior inside the closure of the earlier example:
// - The receive(on:options:) operator ensures that its subsequent operators run on the specified dispatch queue. This replaces the async() call from before.
// - The assign(to:on:) operator updates the data model, by using a key path to set the lastUpdate property.
// Another advantage you’ll find when using Combine to simplify your code is that the Timer.TimerPublisher produces new Date instances as its output type. The first example’s closure receives the Timer itself as its parameter, so it has to create new Date instances manually.

class DateModel {
    var lastUpdated: Date = .init()
}


// ============================================
// Routing Notifications to Combine Subscribers
// ============================================
var notificationToken: NSObjectProtocol?
func rotateDevice() {
    notificationToken = NotificationCenter.default
        .addObserver(forName: UIDevice.orientationDidChangeNotification,
                     object: nil,
                     queue: nil) { _ in
            if UIDevice.current.orientation == .portrait {
                print("Orientation changed to portrait.")
            }
        }
}

// Migrate Notification-Handling Code to Use Combine
//var cancellable: Cancellable? // already defined the abouve
func rotateDevice2() {
    cancellable = NotificationCenter.default
        .publisher(for: UIDevice.orientationDidChangeNotification)
        .filter() { _ in UIDevice.current.orientation == .portrait }
        .sink() { _ in print("Orientation changed to portrait.") }
}
