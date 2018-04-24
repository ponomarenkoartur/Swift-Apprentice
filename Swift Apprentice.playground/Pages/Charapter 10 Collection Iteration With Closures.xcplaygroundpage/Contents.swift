//: [Previous](@previous)

import Foundation

//: Challange A: Repeating yourself

func repeatTask(times: Int, task: () -> Void) {
    for _ in 0..<times {
        task()
    }
}

repeatTask(times: 5) {
    print("Swift Apprentice is a great book!")
}

//: Challange B: Closure sum

func fibonacciNumber(index: Int) -> Int {
    if index < 3 {
        return 1
    }
    var a = 1
    var b = 1
    let count = index
    for _ in 3...count {
        let temp = b
        b = a + b
        a = temp
    }
    return b
}

func mathSum(length: Int, series: (Int) -> Int) -> Int {
    var sum = 0
    for i in 1...length {
        sum += series(i)
    }
    return sum
}

print(mathSum(length: 10, series: { return $0 * $0 }))
print(mathSum(length: 10, series: fibonacciNumber))


//: Challange C: Functional ratings

let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]

var averageRatings: [String: Double] = [:]

appRatings.forEach { appRatings in
    averageRatings[appRatings.key] = appRatings.value.reduce(0.0, {
        $0 + Double($1) / Double(appRatings.value.count)
    })
}

let appsWithAverageRatingGreaterThenThree = averageRatings.filter({ $0.value > 3 }).map({ $0.key })

appsWithAverageRatingGreaterThenThree

//: [Next](@next)
