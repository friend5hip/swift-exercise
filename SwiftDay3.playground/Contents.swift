import UIKit

// MARK: - Closer (클로저)

// 다른 언어의 람다와 비슷
// 일정 기능을 하는 코드를 모아 놓은 것

// 기본 클로저 문법
//{ (a: Int, b: Int) -> Int in
//    return a + b
//}

// 기존 함수
func add(a: Int, b: Int) -> Int {
    var c = 0
    var d = 1
    return a + b
}


// c = 1

let sum = { (a: Int, b: Int) -> Int in
    return a + b
}

// 클로저 호출
let result = sum(1, 2)
let result2 = add(a: 1, b: 2)
print("result: \(result)")

let sum2: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

// 전달 인자로서의 클로저
// - 클로저는 주로 전달 인자로 사용한다.

// 두 수를 더하는 클로저
let add2: (Int, Int) -> Int
add2 = { (a: Int, b: Int) -> Int in
    return a + b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int
calculated = calculate(a: 50, b: 50, method: add2)
print("계산된 값: \(calculated)")

// 따로 클로저를 상수/변수에 할당하지 않고,
// 함수를 호출할 때 클로저를 작성하여 전달할 수 있다.
calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in return left * right })

// 전달 인자로 전달된 클로저의 축약형
func calculate2(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var result3: Int

// 후행 클로저
// 클로저가 함수의 마지막 전달 인자라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 부호 외부에 클로저를 구현할 수 있다.
result3 = calculate2(a: 10, b: 10) { (left: Int, right: Int ) -> Int in
        return left + right
}

// 반환 타입 생략
// 컴파일러가 추론하기 때문에 반환 타입 생략 가능 (in은 생략할 수 없다.)
result3 = calculate2(a: 10, b: 10) { (left: Int, right: Int) in
        return left + right
}

// 단축 인자 이름
// 클로저의 매개변수 이름이 굳이 필요하지 않다면 단축 인자읾을 활용할 수 있다.
result3 = calculate(a: 10, b: 10, method: {
  return $0 + $1
})

// 최대로 줄인 형태
result3 = calculate(a: 10, b: 10) {
    return $0 + $1
}
