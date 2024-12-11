import UIKit

// MARK: - 튜플 Tuple: 여러 값을 하나의 그룹으로 묶는 데이터 타입
// - 그룹 안에 있는 타입이 모두 같아도, 달라도 된다.
// - 컬렉션 타입(Array, Dictionary, Set)과 비슷해보이지만
//   컬렉션 타입이 아니며, 컬렉션 타입의 요소(item)으로 들어갈 수 있다.

var someData: (String, Int, Double, String) = ("abc", 10, 10.11, "efg")
print("someData.0: \(someData.0)")
print("someData.1: \(someData.1)")
print("someData.2: \(someData.2)")
print("someData.3: \(someData.3)")

//someArray[0] // 컬렉션에서의 요소(item) 접근

// MARK: - 컬렉션: Array(배열), Dictionary, Set
// Array: 순서가 있는 리스트 컬렉션
// Dictionary: "키"와 "값"의 쌍으로 이루어진 컬렉션
// Set: 순서가 없고, 멤버가 유일한 컬렉션


// Array(배열): 순서가 있는 리스트 컬렉션

// 빈 Int Array 생성
var integers: Array<Int> = Array<Int>()

// 같은 표현
// var integers: Array<Int> = [Int]()
// var integers: Array<Int> = []
// var integers: [Int] = Array<Int>()
// var integers: [Int] = [Int]()
// var integers: [Int] = []
// var integers = [Int]()

// Array의 활용
integers.append(1)
integers.append(2)
//integers.append(1.1) // Int 타입이 아니므로 컴파일 에러 발생
print("integers: \(integers)")

// 멤버 포함 여부
print("integers.contains(1): \(integers.contains(1))")
print("integers.contains(3): \(integers.contains(3))")
// 멤버 교체
integers[0] = 10
print("integers: \(integers)")
//integers[2] = 30 // 런타임 에러 발생
// 멤버 삭제
integers.remove(at: 0)
print("integers: \(integers)")

// 선언과 동시에 초기화
var integers2 = [0, 1, 2, 3]
print("integers2: \(integers2)")

integers2.removeFirst()
integers2.removeLast()
print("integers2: \(integers2)")
integers2.removeAll() // 전체 요소 삭제

let integers3 = [0, 1, 2, 3] // 불변 배열 생성 할 경우 수정할 수 없다.
//integers3.append(4)
//integers3.remove(at: 0)
//integers3[0] = 10

// Dictionary: "키"와 "값"의 쌍으로 이루어진 컬렉션
var anyDictionary: Dictionary<String, Any> = [String: Any]()

// 같은 표현
// var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
// var anyDictionary: Dictionary <String, Any> = [:]
// var anyDictionary: [String: Any] = Dictionary<String, Any>()
// var anyDictionary: [String: Any] = [String: Any]()
// var anyDictionary: [String: Any] = [:]
// var anyDictionary = [String: Any]()

// Dictionary의 활용
anyDictionary["someKey"] = "value" // "someKey"의 키가 존재하지 않을 경우에는 요소 삽입
print("anyDictionary: \(anyDictionary)")
anyDictionary["someKey"] = 3
print("anyDictionary: \(anyDictionary)")
anyDictionary["anotherKey"] = 30.33 // 요소 추가
print("anyDictionary: \(anyDictionary)")
// 키에 해당하는 값 제거
anyDictionary.removeValue(forKey: "someKey")
print("anyDictionary: \(anyDictionary)")
anyDictionary["anotherKey"] = nil
print("anyDictionary: \(anyDictionary)")

// 불변 Dictionary - 수정 불가
let otherDictionary: [String: Any] = [:]
//otherDictionary["someKey"] = 100 // 요소 추가, 수정, 삭제 불가

anyDictionary["thirdKey"] = "Stirng"
print("anyDictionary: \(anyDictionary)")
//let a1: String = anyDictionary["thirdKey"] // Any 타입 String 타입으로 할당 불가



// Set: 순서가 없고, 멤버가 유일한 컬렉션
// 빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(100)
print(integerSet)

print(integerSet.contains(1)) // true
print(integerSet.contains(2)) // false

integerSet.remove(100)
integerSet.removeFirst()

print(integerSet.count) // 1




// Set는 집합 연산에 꽤 유용합니다
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
//let union: Set<Int> = setA + setB // 컴파일 에러: union() 메서드만 가능
print(union) // [2, 4, 5, 6, 7, 3, 1]

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]
// 내림차순
let sortedDescending = union.sorted(by: >)
print(sortedDescending) // 출력: [7, 6, 5, 4, 3, 2, 1]

// 교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection) // [5, 3, 4]

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting) // [2, 1]


// MARK: - 타입 별칭: Int, String 등 모든 기본 타입 및 클래스명에도 지정할 수 있다.
typealias MyInt = Int
typealias YourInt = Int
var myInt: MyInt = 10
var yourInt: YourInt = 20
print("myInt: \(myInt)")
print("yourInt: \(yourInt)")
let justInt: Int = myInt
print("justInt: \(justInt)")


// MARK: - 연산자

// 단항 연산자: !A
// 이항 연산자: A + B
// 삼항 연산자: A ? B : C
// 전위 연산자: ++A
// 후위 연산자: A++
// 중위 연산자: A + B

// 할당 연산자
var a = 10
// 산술 연산자
var a1 = 10 + 20 // 더하기 연산자
var a2 = 10 - 20 // 빼기 연산자
var a3 = 10 * 20 // 곱하기 연산자
var a4 = 10 / 20 // 나누기 연산자
var a5 = 10 % 20 // 나머지 연산자

// 비교 연산자
var b1 = a1 == a2 // 같음 연산자
var b2 = a1 >= a2 // 크거나 같음 연산자
var b3 = a1 <= a2 // 작거나 같음 연산자
var b4 = a1 > a2 // 큼 연산자
var b5 = a1 < a2 // 작음 연산자
var b6 = a1 != a2 // 다름 연산자

// 삼항 조건 연산자
var c = (a1 == a2) ? "같음" : "다름"

// 범위 연산자
var d = 1...10 // 1부터 10까지 : 폐쇄 연산자(ClosedRange)
print("d: \(d)")
var d1 = 1..<10 // 반폐쇄 연산자
print("d1: \(d1)")
var d2 = 1...
print("d2: \(d2)")
var d3 = ...10
print("d3: \(d3)")
//var d4 = _<10

// 논리 연산자(Bool 연산자)
var e1 = true
!e1
var e2 = false
var e3 = e1 && e2
var e4 = e1 || e2


// 복합 할당 연산자
var f1 = 10
var f2: Int = 0
f2 += 10
f2 -= 10
f2 *= 10
f2 /= 10



// MARK: - 흐름 제어 : 조건문, 반복문

// 조건문: if, switch, guard(옵셔널에서 학습)

// if 문
let first: Int = 5
let second: Int = 7
if first > second { // 조건식에 괄호 사용하지 않아도 됨
    print("first > second")
} else if first < second {
    print("first < second")
} else {
    print("first == second")
}


// switch 문
let integerValue = 5
switch integerValue {
case 0:
    print("Value == zero") // 수행문 필히 작성 필요
case 1...10:
    print("Value == 1~10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break // break 작성하지 않아도 멈춤.
default: // 디폴트 작성 안하면 기본적으로 오류. 값이 확실히 한정적일 때는 디폴트 작성 불필요.
    print("10 < Value <= 100")
}


// 반복문: for-in, while, repeat-while, (구문 이름표)

// for-in
for i in 0...2 {
    print("i: \(i)")
}

for i in 0...5 {
    if i.isMultiple(of: 2) {
        print(i)
        continue
    }
    print("\(i)는 홀수입니다.")
}

for _ in 0...5 {
    print("출력만 할래.")
}

// Dictionary
let friends: [String: Int] = ["Jay": 35, "June": 30, "Johny": 32]
for tuple in friends {
    print(tuple)
}
// 튜플 분리
for (name, age) in friends {
    print("name: \(name)")
    print("age: \(age)")
}

// while
var names: [String] = ["Cavin", "July"]
while names.isEmpty == false {
    print("Goodbye \(names.removeFirst())")
}

print("------------------------------------")

// repeat-while: 다른 언어에서의 do-while과 같음
var names2: [String] = ["Cavin", "July", "Junho"]
repeat {
    print("Goodbye \(names2.removeFirst())")
} while names2.isEmpty == false


// 구문 이름표
var numbers: [Int] = [3, 2342, 6, 3252]
numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop
    }
}
