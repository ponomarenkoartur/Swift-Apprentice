//: [Previous](@previous)

import Foundation

//: Challenge 1

struct Circle {
    var radius = 0.0
    var area: Double {
        get {
            return .pi * radius * radius
        }
        set {
            radius = sqrt(newValue / .pi)
        }
    }
    init (radius: Double) {
        self.radius = radius
    }
    
    mutating func grow(byFactor factor: Double) {
        area *= factor
    }
}

//: Challenge 2

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
    var month: String
    var day: Int
    init(month: String, day: Int) {
        self.month = month
        self.day = day
    }
    mutating func advance() {
        var maxNumberOfDay: Int
        switch month {
        case months[3], months[5], months[8], months[10]:
            maxNumberOfDay = 30
        case months[1]:
            maxNumberOfDay = 28
        default:
            maxNumberOfDay = 31
        }
        if day + 1 > maxNumberOfDay {
            month = months[(months.index(of: month)! + 1) % 12]
        }
        day = (day + 1) % maxNumberOfDay
    }
}
var current = SimpleDate(month: "February", day: 28)
current.advance()
let currentMonth = current.month // December; should be January!
let currentDay = current.day // 32; should be 1!

//: Challenge 3

struct Math {
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1, *)
    }
    
    static func isEven(_ number: Int) -> Bool {
        return number % 2 == 0
    }
    
    static func isOdd(_ number: Int) -> Bool {
        return !isEven(number)
    }
}

//: Challenge 4

extension Int {
    var isEven: Bool {
        return Math.isEven(self)
    }
    
    var isOdd: Bool {
        return Math.isOdd(self)
    }
}

//: Challenge 5

extension Int {
    func primeFactors() -> [Int] {
        var remainingValue = self
        var testFactor = 2
        var primes: [Int] = []
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}


//: [Next](@next)
