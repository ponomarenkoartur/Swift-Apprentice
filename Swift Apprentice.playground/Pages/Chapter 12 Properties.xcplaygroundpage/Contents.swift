//: [Previous](@previous)
import Foundation

//: Challenge A: We all scream for ice cream

struct IceCream {
    let name = "Plombir"
    lazy var ingredients = {
        return ["Milk", "Water", "Sugar"]
    }
}

//: Challenge B

struct FuelTank {
    var level: Double {
        didSet {
            switch level {
            case let x where x < 0:
                level = 0
            case 0...0.1:
                lowFuel = true
            case let x where x > 1:
                level = 1
            default:
                break
            }
        }
    }
    
    var lowFuel = false
}

var fuelTank = FuelTank(level: 0.5, lowFuel: true)
fuelTank.level = 0.1
fuelTank.level
fuelTank.lowFuel
//: [Next](@next)
