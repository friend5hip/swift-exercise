import UIKit

var greeting = "Hello, playground"

// MARK: - 고차함수
// - 고차함수는 '다른 함수를 전달 인자로 받거나 함수 실행 결과를 함수로 반환하는 함수'다.
// - 스위프트 표준 라이브러리에서 제공하는 고차함수들이 있다.
// - 주로 컬렉션(컨테이너) 관련 (Array, Set, Dictionary 등)
// - map, filter, reduce 등이 있다.

// map
// - map 함수는 컬렉션 내부의 기존 데이터를 변형하여 새로운 컬렉션을 생성한다.
// - map 함수 내부에 클로저를 사용해 값을 변형시킨다.
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubleNumbers: [Int]
var strings: [String]

doubleNumbers = numbers.map({(a: Int) -> Int in return a * 2})
print(doubleNumbers)

doubleNumbers = numbers.map({ $0 * 2 })

// filter
let oddNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 != 0
}
print(oddNumbers)

// reduce
// - reduce 함수는
// 초기값을 0으로 갖고 배열 내 모든 값을 더한다.
let sum: Int = numbers.reduce(0, { (first: Int, second: Int) -> Int in
    return first + second
})
print(sum)

let someStrings: [String] = ["a", "b", "c"]
let sum2 : String = someStrings.reduce("초기값", { (first: String, second: String) -> String in
    print("\(first) + \(second)")
    return first + second
})
print(someStrings)
