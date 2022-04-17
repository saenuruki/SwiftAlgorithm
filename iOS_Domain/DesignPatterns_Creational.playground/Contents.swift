import UIKit
import Foundation

/// Source:
/// https://github.com/ochococo/Design-Patterns-In-Swift

/// Creational;
/// In Software engineering, creational design patterns are design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation.
/// The basic form of object creation could result in design problems or added complexity to the design.
/// Creational design patterns solve this problem by somehow controlling this object creation.

/// Abstruct Factory
/// The abstract factory pattern is used to provide a client with a set of related or dependant objects.
/// The "family" of objects created by the factory are determined at run-time.

protocol BurgerDescribing {
    var ingredients: [String] { get }
}

struct CheeseBurger: BurgerDescribing {
    let ingredients: [String]
}

protocol BurgerMaking {
    func make() -> BurgerDescribing
}

final class BigKahunaBurger: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Lettuce", "TOmato"])
    }
}

final class JackInTheBox: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Tomato", "Onions"])
    }
}

enum BurgerFactoryType: BurgerMaking {
    case bigKahuna
    case jackInTheBox
    
    func make() -> BurgerDescribing {
        switch self {
        case .bigKahuna: return BigKahunaBurger().make()
        case .jackInTheBox: return JackInTheBox().make()
        }
    }
}

let bigKahuna = BurgerFactoryType.bigKahuna.make()
let jackInTheBox = BurgerFactoryType.jackInTheBox.make()

/// Builder
/// The builder pattern is used to create complex objects with constituent parts that must be creaed in the same order or using a specific algorithem.
/// An exernal class controls the construction algorithm.

final class DeathStarBuilder {
    var x: Double?
    var y: Double?
    var z: Double?

    typealias BuildClosure = (DeathStarBuilder) -> ()
    
    init(buildClosure: BuildClosure) {
        buildClosure(self)
    }
}

struct DeathStar: CustomStringConvertible {
    let x: Double
    let y: Double
    let z: Double
    
    init?(builder: DeathStarBuilder) {
        if let x = builder.x, let y = builder.y, let z = builder.z {
            self.x = x
            self.y = y
            self.z = z
        } else {
            return nil
        }
    }
    
    var description: String {
        return "Death Star at (x:\(x) y:\(y) z:\(z))"
    }
}

let empire = DeathStarBuilder { builder in
    builder.x = 0.1
    builder.y = 0.2
    builder.z = 0.3
}
let deathStar = DeathStar(builder: empire)

/// Factory Method
/// The factory pattern is used to replace class constructors, abstracting the process of object generation so that the type of the object instantiated can be determined at run-time.

protocol Currency {
    var symbol: String { get }
    var code: String { get }
}

final class Euro: Currency {
    var symbol: String { return "€" }
    var code: String { return "EUR" }
}

final class USDolar: Currency {
    var symbol: String { return "$" }
    var code: String { return "USD" }
}

enum Country {
    case unitedStates
    case spain
    case uk
    case greece
}

enum CurrenctFactory {
    static func currency(for country: Country) -> Currency? {
        switch country {
        case .spain, .greece: return Euro()
        case .unitedStates: return USDolar()
        case .uk: return nil
        }
    }
}

let noCuurencyCode = "No Currency Code Available"
CurrenctFactory.currency(for: .greece)?.code ?? noCuurencyCode
CurrenctFactory.currency(for: .spain)?.code ?? noCuurencyCode
CurrenctFactory.currency(for: .unitedStates)?.code ?? noCuurencyCode
CurrenctFactory.currency(for: .uk)?.code ?? noCuurencyCode

/// Monostate
/// The monostate pattern is another way to achieve singularity.
/// It works through a completely different mechanism, it enforces the behavior of singularity without imposing structural constraints.
/// So in that case, monostate saves the state as static instead of the entire instance as a sigleton.

class Settings {
    enum Theme {
        case `default`
        case old
        case new
    }
    
    private static var theme: Theme?
    
    var currentTheme: Theme {
        get { Settings.theme ?? .default }
        set(newTheme) { Settings.theme = newTheme }
    }
}

let settings = Settings()
settings.currentTheme = .new
let screenColor: UIColor = Settings().currentTheme == .old ? .gray : .white
let screenTitle: String = Settings().currentTheme == .old ? "Itunes Connect" : "App Store Connect"

/// Prototype
/// The prototype pattern is used to instantiate a new object  by copying all of the properties of an existing object, creating an independent clone.
/// This practise is particularly useful when the construction of a new object is inefficient.

class MonoWorker {
    let name: String
    var health: Int = 100
    
    init(name: String) {
        self.name = name
    }
    
    func clone() -> MonoWorker {
        return MonoWorker(name: name)
    }
}

let prototype = MonoWorker(name: "Sam Bell")
var bell1 = prototype.clone()
bell1.health = 120
var bell2 = prototype.clone()
bell2.health = 80

/// Singleton
/// The singleton pattern ensures that only one object of a particuylar class is ever created.
/// All further references to objects of the singleton class refer to the same underlying instance.
/// There are very few applications, do not overuse this pattern.

final class ElonMask {
    static let shared = ElonMask()
    
    private init() {
        // private initialization to ensure just one instance is created.
    }
}

let elon = ElonMask.shared // There is only one Elon Mask folks.
