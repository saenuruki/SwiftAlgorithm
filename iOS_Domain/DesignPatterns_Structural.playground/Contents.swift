import UIKit

/// Source:
/// https://github.com/ochococo/Design-Patterns-In-Swift

/// Structural
/// In software engineering, structural design patterns are design patterns that ease the design by identifying a simple way to realize relationships between entities.

/// Adapter
/// The adapter pattern is used to provide a link between two otherwise incompatible types by wrapping the "adaptee" with a class that supports the interface required by the client.

protocol NewSuperLaserAiming {
    var angleV: Double { get }
    var angleH: Double { get }
}

struct OldSuperLaser {
    let angleHorizontal: Float
    let angleVertical: Float
    
    init(angleHorizontal: Float, angleVertical: Float) {
        self.angleHorizontal = angleHorizontal
        self.angleVertical = angleVertical
    }
}

struct NewSuperLaser: NewSuperLaserAiming {
    private let target: OldSuperLaser
    
    var angleH: Double { return Double(target.angleHorizontal) }
    var angleV: Double { return Double(target.angleVertical) }
    
    init(_ target: OldSuperLaser) {
        self.target = target
    }
}

let target = OldSuperLaser(angleHorizontal: 14.0, angleVertical: 12.0)
let newFormat = NewSuperLaser(target)
newFormat.angleH
newFormat.angleV

/// Bridge
/// The bridge pattern is used to separate the abstract elements of a class from the implementation details, providing the means to replace the implementation details without modifying the abstraction.

protocol Switch {
    var appliance: Appliance { get set }
    func turnOn()
}

protocol Appliance {
    func run()
}

final class RemoteControl: Switch {
    var appliance: Appliance
    
    func turnOn() {
        self.appliance.run()
    }
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
}

final class TV: Appliance {
    func run() { print("tv turned on") }
}

final class VacuumCleaner: Appliance {
    func run() { print("vacuum cleaner turned on") }
}

let tvRemoteControl = RemoteControl(appliance: TV())
tvRemoteControl.turnOn()

let fancyVacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
fancyVacuumCleanerRemoteControl.turnOn()

/// Composite
/// The composite pattern is used to create hierarchical, recursive tree structures of related objects where any element of the structure may be accessed and utilised in a standard manner.

protocol Shape {
    func draw(fillColor: String)
}

final class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

final class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}

final class Whiteboard: Shape {
    private lazy var shapes = [Shape]()
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }

    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

var whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw(fillColor: "Red")

/// Decorator
/// The decorator pattern is used to extend or alter the functionality of objects at run- time by wrapping them in an object of a decorator class.
/// This provides a flexible alternative to using inheritance to modify behaviour.

protocol CostHaving {
    var cost: Double { get }
}

protocol IngredientsHaving {
    var ingredients: [String] { get }
}

typealias BeverageDataHaving = CostHaving & IngredientsHaving

struct SimpleCoffee: BeverageDataHaving {
    let cost: Double = 1.0
    let ingredients = ["Water", "Coffee"]
}

protocol BeverageHaving: BeverageDataHaving {
    var beverage: BeverageDataHaving { get }
}

struct Milk: BeverageHaving {
    let beverage: BeverageDataHaving
    var cost: Double { return beverage.cost + 0.5 }
    var ingredients: [String] { return beverage.ingredients + ["Milk"] }
}

struct WhipCoffee: BeverageHaving {
    let beverage: BeverageDataHaving
    var cost: Double { return beverage.cost + 0.5 }
    var ingredients: [String] { return beverage.ingredients + ["Whip"] }
}

var someCoffee: BeverageDataHaving = SimpleCoffee()
print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
someCoffee = Milk(beverage: someCoffee)
print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
someCoffee = WhipCoffee(beverage: someCoffee)
print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")

/// Façade
/// The façade pattern is used to define a simplified interface to a more complex subsystem.

final class Defaults {
    private let defaults: UserDefaults
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    subscript(key: String) -> String? {
        get {
            return defaults.string(forKey: key)
        }
        set {
            defaults.set(newValue, forKey: key)
        }
    }
}

let storage = Defaults()
// Store
storage["Bishop"] = "Disconnect me. I’d rather be nothing"
// Read
storage["Bishop"]

/// Flyweight
/// The flyweight pattern is used to minimize memory usage or computational expenses by sharing as much as possible with other similar objects.

// Instances of SpecialityCoffee will be the Flyweights
struct SpecialityCoffee {
    let origin: String
}

protocol CoffeeSearching {
    func search(origin: String) -> SpecialityCoffee?
}

final class Menu: CoffeeSearching {
    private var coffeeAvailable: [String: SpecialityCoffee] = [:]
    
    func search(origin: String) -> SpecialityCoffee? {
        if coffeeAvailable.index(forKey: origin) == nil {
            coffeeAvailable[origin] = SpecialityCoffee(origin: origin)
        }
        return coffeeAvailable[origin]
    }
}

final class CoffeeShop {
    private var orders: [Int: SpecialityCoffee] = [:]
    private let menu: CoffeeSearching
    
    init(menu: CoffeeSearching) {
        self.menu = menu
    }
    
    func takeOrder(origin: String, table: Int) {
        orders[table] = menu.search(origin: origin)
    }
    
    func serve() {
        for (table, origin) in orders {
            print("Serving \(origin) to table \(table)")
        }
    }
}

let coffeeShop = CoffeeShop(menu: Menu())
coffeeShop.takeOrder(origin: "Yirgacheffe, Ethiopia", table: 1)
coffeeShop.takeOrder(origin: "Buziraguhindwa, Burundi", table: 3)
coffeeShop.serve()

/// Protection Proxy
/// The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object.
/// Protection proxy is restricting access.

protocol DoorOpening {
    func open(doors: String) -> String
}

final class HAL9000: DoorOpening {
    func open(doors: String) -> String {
        return ("HAL9000: Affirmative, Dave. I read you. Opened \(doors).")
    }
}

final class CurrentComputer: DoorOpening {
    private var computer: HAL9000!
    
    func authenticate(password: String) -> Bool {
        guard password == "pass" else { return false }
        computer = HAL9000()
        return true
    }

    func open(doors: String) -> String {
        guard computer != nil else { return "Access Denied. I'm afraid I can't do that." }
        return computer.open(doors: doors)
    }
}

let computer = CurrentComputer()
let podBay = "Pod Bay Doors"
computer.open(doors: podBay)
computer.authenticate(password: "pass")
computer.open(doors: podBay)

/// Virtual Proxy
/// The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object.
/// Virtual proxy is used for loading object on demand.

protocol HEVSuitMedicalAid {
    func administerMorphine() -> String
}

final class HEVSuit: HEVSuitMedicalAid {
    func administerMorphine() -> String {
        return "Morphine administered."
    }
}

final class HEVSuitHumanInterface: HEVSuitMedicalAid {
    lazy private var physicalSuit: HEVSuit = HEVSuit()
    
    func administerMorphine() -> String {
        return physicalSuit.administerMorphine()
    }
}

let humanInterface = HEVSuitHumanInterface()
humanInterface.administerMorphine()
