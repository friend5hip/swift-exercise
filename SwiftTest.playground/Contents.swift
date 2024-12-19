import UIKit

// MARK: - 기본 문법

// 변수와 상수
// - 변수(var): 값을 변경할 수 있음
// - 상수(let): 초기화하면 변경 불가능함
var variable = 10
let constant = 20
variable = 20
// constant = 30

// 선언 후 초기화 가능
var variabe2: Int
let constant2: Int

variabe2 = 20
constant2 = 30

class TestClass {
    // 클래스 안에서는 선언과 동시에 초기화해주거나 initializer로 초기화해야 함
    var variable3: Int
    let constant3: Int
    
    init (variable3: Int, constant3: Int) {
        self.variable3 = variable3
        self.constant3 = constant3
    }
}

//class TestClass2 {
//    lazy var variable4: Int
//    init() {
//        
//    }
//}

// 데이터 타입
// - 주요 데이터 타입: Int, Double, Float, Bool, String, Character

// 타입 명시하지 않아도 컴파일러가 추론
var variable4 = 0
var string = ""

// MARK: - 옵셔널
// - 값이 있을 수도, 없을 수도 있는 상태를 표헌
// - 옵셔널 선언: ?

var name: String? = "John"
//name = nil // nil 값 대입 가능
var name2: String! = "John"
name2 = nil

// 옵셔널 바인딩
// - 옵셔널 변수를 안전하게 추출
if let unwrappedName = name {
    print("name: \(unwrappedName)")
} else {
    print("이름 없음")
}

// 옵셔널 체이닝
// - 중첩된 옵셔널에 접근
let length = name?.count // 옵셔널 변환
print("length: \(length)")


// MARK: - 조건문
let age = 20
if age > 19 {
    print("어른입니다.")
} else {
    print("어른이 아닙니다.")
}

// MARK: - 반목문
// - for..in 문 사용
let numbers = [1, 2, 3]
for number in numbers {
    print("number: \(number)")
}

// while 문
var count = 5
while count > 0 {
    print("count: \(count)")
    count -= 1
}

// switch 문

// MARK: - 함수
// 함수 정의 및 호출
func greet(name: String) -> String {
    return "Hello \(name)"
}
greet(name: "하이")

func greet2(name: String = "디폴트 값") -> String {
    return "\(name)"
}
greet2()

func sum(numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}
print(sum(numbers: 1, 2, 3))

      
// 전달인자 레이블
func substract(from a: Int, to b: Int) -> Int {
    return a - b
}
substract(from: 10, to: 2)

// 전달인자 레이블 (전달인자명 생략 가능)
func substract(_ a: Int, _ b: Int) -> Int {
    return a - b
}
substract(10, 2)

// MARK: - 함수형 프로그래밍
// 클로저
// - 코드 블록을 변수(값)처럼 사용 가능
let multiply = { (a: Int, b: Int) -> Int in return a * b }
print(multiply(2, 3))


// 매개변수로의 클로저
// 후행 클로저
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) {
    let result = method(a, b)
    print(result)
}
calculate(a: 10, b: 5, method: multiply)

// 클로저 타입 선언과 정의
let add: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}

// calculate 함수 호출
calculate(a: 10, b: 5, method: add)

// 인라인 클로저로 호출
calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left
})

calculate(a: 10, b: 10) { $0 + $1 }

// MARK: - 컬렉션
// Array
var numbers2: [Int] = [1, 2, 3]
numbers2.append(4)

// Set : 순서, 중복 없음
var fruits: Set = ["Apple", "Banana", "Kiwi"]
fruits.insert("Grape")

// Dictionary
var user: [String: String] = ["name": "John", "age": "20"]
print(user["user"] ?? "Unknown")

// MARK: - 고차함수
let numbers3 = [1, 2, 3, 4, 5]

let doubled = numbers3.map { $0 * 2 }

let evens = numbers3.filter { $0 % 2 == 0 }

let sum = numbers3.reduce(0, +)

// MARK: - 구조체와 클래스

// 구조체는 값 타입
struct Person {
    var name: String
    var age: Int
}

// 클래스는 참조 타입
class Car {
    var brand: String = "brand"
    func drive() {
        print("Driving")
    }
}

let car = Car()
car.brand = "Tesla"
car.drive()

// MARK: - 프토토콜
// 특정 공통 기능이나 동작을 정의
// 구현부는 없음

protocol Animal {
    var name: String { get }
    func makeSound()
}

struct Cat {
    var name: String
    func makeSound() {
        print("야옹")
    }
}

// MARK: - 열거형
enum Direction {
    case N, S, E, W
}
let move = Direction.N

// 연관값 사용
enum Result {
    case success(data: String)
    case failure(error: String)
}

let result = Result.success(data: "OK")

switch result {
case .success(let data):
    print(data)
case .failure(let error):
    print(error)
}
// MARK: - 에러 처리
// - do-catch 구문을 사용하여 에러 처리
enum VendingError: Error {
    case outOfStock
}

func vend(item: String) throws {
    throw VendingError.outOfStock
}

do {
    try vend(item: "Chips")
} catch {
    print("Error occurred: \(error)")
}
