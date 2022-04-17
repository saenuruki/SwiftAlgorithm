import UIKit

/// Source:
/// https://github.com/ochococo/Design-Patterns-In-Swift

/// Behavioral
/// In software engineering, behavioral design patterns are design patterns that identify common communication patterns between objects and realize these patterns.
/// By doing so, these patterns increase flexibility in carrying out this communication.


/// Chain Of Responsibility
/// The chain of responsibility pattern is used to process varied requests, each of which may be dealt with by a different handler.

protocol Withdrawing {
    func withdraw(amout: Int) -> Bool
}

final class MoneyPipe: Withdrawing {
    let value: Int
    let quantity: Int
    var next: Withdrawing?
    
    init(value: Int, quantity: Int, next: Withdrawing?) {
        self.value = value
        self.quantity = quantity
        self.next = next
    }
    
    func withdraw(amout: Int) -> Bool {
        var amout = amout
        var quantity = self.quantity
        
        while canTakeSomeBill(want: amout) {
            if quantity == 0 { break }
            amout -= self.value
            quantity -= 1
        }
        
        guard amout > .zero else { return true }
        guard let next = self.next else { return false }
        return next.withdraw(amout: amout)
    }

    private func canTakeSomeBill(want: Int) -> Bool {
        return (want / self.value) > 0
    }
}

final class ATM: Withdrawing {
    private var hundred: Withdrawing
    private var fifty: Withdrawing
    private var twenty: Withdrawing
    private var ten: Withdrawing
    
    private var startPile: Withdrawing { return self.hundred }
    
    init(hundred: Withdrawing, fifty: Withdrawing, twenty: Withdrawing, ten: Withdrawing) {
        self.hundred = hundred
        self.fifty = fifty
        self.twenty = twenty
        self.ten = ten
    }
    
    func withdraw(amout: Int) -> Bool {
        return startPile.withdraw(amout: amout)
    }
}

// Create piles of money and link them together 10 < 20 < 50 < 100.**
let ten = MoneyPipe(value: 10, quantity: 6, next: nil)
let twenty = MoneyPipe(value: 20, quantity: 2, next: ten)
let fifty = MoneyPipe(value: 50, quantity: 2, next: twenty)
let hundred = MoneyPipe(value: 100, quantity: 1, next: fifty)

// Build ATM.
var atm = ATM(hundred: hundred, fifty: fifty, twenty: twenty, ten: ten)
atm.withdraw(amout: 310)
atm.withdraw(amout: 100)

/// Command
/// The command pattern is used to express a request, including the call to be made and all of its required parameters, in a command object.
/// The command may then be executed immediately or held for later use.

protocol DoorCommand {
    func execute() -> String
}

final class OpenCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Opened \(doors)"
    }
}

final class ClosedCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
}

final class HAL9000DoorsOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        openCommand = OpenCommand(doors: doors)
        closeCommand = ClosedCommand(doors: doors)
    }
    
    func close() -> String {
        return closeCommand.execute()
    }
    
    func open() -> String {
        return openCommand.execute()
    }
}

let opdBayDoors = "Pod Bay Doors"
let doorModule = HAL9000DoorsOperations(doors: opdBayDoors)
doorModule.open()
doorModule.close()

/// Interpreter
/// The interpreter pattern is used to evaluate sentences in a language.

protocol IntegerExpression {
    func evaluate(_ context: IntegerContext) -> Int
    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression
    func copied() -> IntegerExpression
}

final class IntegerContext {
    private var data: [Character: Int] = [:]
    
    func lookup(name: Character) -> Int {
        return self.data[name]!
    }
    func assign(expression: IntegerVariableExpression, value: Int) {
        self.data[expression.name] = value
    }
}

final class IntegerVariableExpression: IntegerExpression {
    let name: Character
    
    init(name: Character) {
        self.name = name
    }

    func evaluate(_ context: IntegerContext) -> Int {
        return context.lookup(name: self.name)
    }
    
    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        if name == self.name {
            return integerExpression.copied()
        } else {
            return IntegerVariableExpression(name: self.name)
        }
    }
    
    func copied() -> IntegerExpression {
        return IntegerVariableExpression(name: self.name)
    }
}

final class AddExpression: IntegerExpression {
    private var operand1: IntegerExpression
    private var operand2: IntegerExpression
    
    init(op1: IntegerExpression, op2: IntegerExpression) {
        self.operand1 = op1
        self.operand2 = op2
    }
    
    func evaluate(_ context: IntegerContext) -> Int {
        return self.operand1.evaluate(context) + self.operand2.evaluate(context)
    }
    
    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        return AddExpression(op1: operand1.replace(character: character, integerExpression: integerExpression),
                             op2: operand2.replace(character: character, integerExpression: integerExpression))
    }
    
    func copied() -> IntegerExpression {
        return AddExpression(op1: self.operand1, op2: self.operand2)
    }
}

let context = IntegerContext()
var a = IntegerVariableExpression(name: "A")
var b = IntegerVariableExpression(name: "B")
var c = IntegerVariableExpression(name: "C")
var expression = AddExpression(op1: a, op2: AddExpression(op1: b, op2: c)) // a + (b + c)
context.assign(expression: a, value: 2)
context.assign(expression: b, value: 1)
context.assign(expression: c, value: 3)
var result = expression.evaluate(context)

/// Iterator
/// The iterator pattern is used to provide a standard interface for traversing a collection of items in an aggregate object without the need to understand its underlying structure.

struct Novella {
    let name: String
}

struct Novellas {
    let novellas: [Novella]
}

struct NovellasIterator: IteratorProtocol {
    private var current = 0
    private let novellas: [Novella]
    
    init(novellas: [Novella]) {
        self.novellas = novellas
    }
    
    mutating func next() -> Novella? {
        defer { current += 1 }
        return novellas.count > current ? novellas[current] : nil
    }
}

extension Novellas: Sequence {
    func makeIterator() -> NovellasIterator {
        return NovellasIterator(novellas: novellas)
    }
}

let greatNovellas = Novellas(novellas: [Novella(name: "The Mist"), Novella(name: "The Mist2"), Novella(name: "The Mist3"), Novella(name: "The Mist4")] )
for novella in greatNovellas {
    print("I've read: \(novella)")
}
// 本来 Arrayに対して for-in loopは使用可能だが、今回のようにStructに対して for-in loopを直接利用できるようにIteratorのルールを定義することが可能

/// Mediator
/// The mediator pattern is used to reduce coupling between classes that communicate with each other.
/// Instead of classes communicating directly, and thus requiring knowledge of their implementation, the classes send messages via a mediator object.

protocol Receiver {
    associatedtype MessageType
    func receive(message: MessageType)
}

protocol Sender {
    associatedtype MessageType
    associatedtype ReceiverType: Receiver

    var recipients: [ReceiverType] { get }
    func send(message: MessageType)
}

struct Programmer: Receiver {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receive(message: String) {
        print("\(name) received: \(message)")
    }
}

final class MessageMediator: Sender {
    internal var recipients: [Programmer] = []
    
    func add(recipient: Programmer) {
        recipients.append(recipient)
    }
    
    func send(message: String) {
        for recipient in recipients {
            recipient.receive(message: message)
        }
    }
}

func spamMonster(message: String, worker: MessageMediator) {
    worker.send(message: message)
}

let messagesMediator = MessageMediator()
let user0 = Programmer(name: "Linus Torvalds")
let user1 = Programmer(name: "Avadis 'Avie' Tevanian")
messagesMediator.add(recipient: user0)
messagesMediator.add(recipient: user1)
spamMonster(message: "I'd Like to Add you to My Professional Network", worker: messagesMediator)

/// Memento
/// The memento pattern is used to capture the current state of an object and store it in such a manner that it can be restored at a later time without breaking the rules of encapsulation.

typealias Memento = [String: String]

protocol MementoConvertible {
    var memento: Memento { get }
    init?(memento: Memento)
}

struct GameState: MementoConvertible {
    private enum Keys {
        static let chapter = "com.valve.halflife.chapter"
        static let weapon = "com.valve.halflife.weapon"
    }
    
    var chapter: String
    var weapon: String
    
    init(chapter: String, weapon: String) {
        self.chapter = chapter
        self.weapon = weapon
    }

    init?(memento: Memento) {
        guard
            let mementoChapter = memento[Keys.chapter],
            let mementoWeapon = memento[Keys.weapon]
        else { return nil }
        chapter = mementoChapter
        weapon = mementoWeapon
    }
    
    var memento: Memento {
        return [Keys.chapter: chapter, Keys.weapon: weapon]
    }
}

enum CheckPoint {
    private static let defaults = UserDefaults.standard
    
    static func save(_ state: MementoConvertible, saveName: String) {
        defaults.set(state.memento, forKey: saveName)
        defaults.synchronize()
    }
    
    static func restore(saveName: String) -> Any? {
        return defaults.object(forKey: saveName)
    }
}

var gameState = GameState(chapter: "Black Mesa Inbound", weapon: "Crowbar")
gameState.chapter = "Anomalous Materials"
gameState.weapon = "Glock 17"
CheckPoint.save(gameState, saveName: "gameState1")

gameState.chapter = "Unforeseen Consequences"
gameState.weapon = "MP5"
CheckPoint.save(gameState, saveName: "gameState2")

gameState.chapter = "Office Complex"
gameState.weapon = "Crossbow"
CheckPoint.save(gameState, saveName: "gameState3")

if let memento = CheckPoint.restore(saveName: "gameState1") as? Memento {
    let finalState = GameState(memento: memento)
    dump(finalState)
}

/// Observer
/// The observer pattern is used to allow an object to publish changes to its state.
/// Other objects subscribe to be immediately notified of any changes.

protocol PropertyObserver: AnyObject {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

final class TestChambers {
    weak var observer: PropertyObserver?
    private let testChamberNumberName = "testChamberNumber"
    
    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            observer?.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
        }
    }
}

final class Observer: PropertyObserver {
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if newPropertyValue as? Int == 1 {
            print("Okay. Look. We both said a lot of things that you're going to regret.")
        }
    }
    
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since you killed me.")
        }
    }
}

var observerInstance = Observer()
var testChambers = TestChambers()
testChambers.observer = observerInstance
testChambers.testChamberNumber += 1
// この例はどちらかというと、Delegateパターンに似ている。ただし willSetとdidSetのタイミングで呼ばれるため、Observerパターンとして利用される

/// State
/// The state pattern is used to alter the behaviour of an object as its internal state changes.
/// The pattern allows the class for an object to apparently change at run-time.

final class Context {
    private var state: State = UnahtorizedState()
    
    var isAuthorized: Bool {
        get { return state.isAuthorized(context: self) }
    }
    
    var userID: String? {
        get { return state.userID(context: self) }
    }
    
    func changeStateToAuthorized(userID: String) {
        state = AuthorizedState(userID: userID)
    }
    
    func changeStateToUnauthorized() {
        state = UnahtorizedState()
    }
}

protocol State {
    func isAuthorized(context: Context) -> Bool
    func userID(context: Context) -> String?
}

class UnahtorizedState: State {
    func isAuthorized(context: Context) -> Bool { return false }
    func userID(context: Context) -> String? { return nil }
}

class AuthorizedState: State {
    let userID: String
    init(userID: String) {
        self.userID = userID
    }
    
    func isAuthorized(context: Context) -> Bool { return true }
    func userID(context: Context) -> String? { return userID }
}

let userContext = Context()
print("\(userContext.isAuthorized), \(userContext.userID ?? "")")
userContext.changeStateToAuthorized(userID: "admin")
print("\(userContext.isAuthorized), \(userContext.userID ?? "")")
userContext.changeStateToUnauthorized()
print("\(userContext.isAuthorized), \(userContext.userID ?? "")")

/// Strategy
/// The strategy pattern is used to create an interchangeable family of algorithms from which the required process is chosen at run-time.

struct TestSubject {
    let pupilDiameter: Double
    let blushResponse: Double
    let isOrganic: Bool
}

protocol RealnessTesting: AnyObject {
    func testRealness(_ testSubject: TestSubject) -> Bool
}

final class VoightKampffTest: RealnessTesting {
    func testRealness(_ testSubject: TestSubject) -> Bool {
        return testSubject.pupilDiameter < 30.0 || testSubject.blushResponse == 0.0
    }
}

final class GeneticTest: RealnessTesting {
    func testRealness(_ testSubject: TestSubject) -> Bool {
        return testSubject.isOrganic
    }
}

final class BladeRunner {
    private let strategy: RealnessTesting
    
    init(test: RealnessTesting) {
        self.strategy = test
    }
    
    func testIfAndroid(_ testSubject: TestSubject) -> Bool {
        return !strategy.testRealness(testSubject)
    }
}

let rachel = TestSubject(pupilDiameter: 30.2, blushResponse: 0.3, isOrganic: false)
// Deckard is using a traditional test
let deckard = BladeRunner(test: VoightKampffTest())
let isRachelAndroid = deckard.testIfAndroid(rachel)
// Gaff is using a very precise method
let gaff = BladeRunner(test: GeneticTest())
let isDeckardAndroid = gaff.testIfAndroid(rachel)

/// Template Method
/// The template method pattern defines the steps of an algorithm and allows the redefinition of one or more of these steps.
/// In this way, the template method protects the algorithm, the order of execution and provides abstract methods that can be implemented by concrete types.

protocol Garden {
    func prepareSoil()
    func plantSeeds()
    func waterPlants()
    func prepareGarden()
}

extension Garden {
    func prepareGarden() {
        prepareSoil()
        plantSeeds()
        waterPlants()
    }
}

final class RoseGarden: Garden {
    func prepare() {
        prepareGarden()
    }
    
    func prepareSoil() {
        print ("prepare soil for rose garden")
    }
    
    func plantSeeds() {
        print ("plant seeds for rose garden")
    }
    
    func waterPlants() {
        print ("water the rose garden")
    }
}

let roseGarden = RoseGarden()
roseGarden.prepare()

/// Visitor
/// The visitor pattern is used to separate a relatively complex set of structured data classes from the functionality that may be performed upon the data that they hold.

protocol PlanetVisitor {
    func visit(planet: PlanetAlderaan)
    func visit(planet: PlanetCoruscant)
    func visit(planet: PlanetTatooine)
    func visit(planet: MoonJedha)
}

protocol Planet {
    func accept(visitor: PlanetVisitor)
}

final class MoonJedha: Planet {
    func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

final class PlanetAlderaan: Planet {
    func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

final class PlanetCoruscant: Planet {
    func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

final class PlanetTatooine: Planet {
    func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

final class NameVisitor: PlanetVisitor {
    var name = ""
    
    func visit(planet: PlanetAlderaan) { name = "Alderaan" }
    func visit(planet: PlanetCoruscant) { name = "Coruscant" }
    func visit(planet: PlanetTatooine) { name = "Tatooine" }
    func visit(planet: MoonJedha) { name = "Jedha" }
}

let planets: [Planet] = [PlanetAlderaan(), PlanetCoruscant(), PlanetTatooine(), MoonJedha()]
let names = planets.map { planet -> String in
    let visitor = NameVisitor()
    planet.accept(visitor: visitor)
    return visitor.name
}
