import UIKit

// MARK: - 열거형(enum)의 연관값
enum MainDish {
    case pasta(taste: String)
    case pizz(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

// 원시값 rawValue
enum MainDish2 : String {
    case pasta = "pasta"
}

// 연관값은 항목 자체에 해당되는 값
var mainDish = MainDish2.pasta
var mainDish2 = MainDish2.pasta
print("mainDish.rawValue: \(mainDish.rawValue)")
print("mainDish2.rawValue: \(mainDish2.rawValue)")

// 연관값
var pasta = MainDish.pasta(taste: "크림")
var pasta2 = MainDish.pasta(taste: "토마토")
print("pasta: \(pasta)")
print("pasta2: \(pasta2)")

// enum은 사용자 정의 데이터를 만들기 위해 데이터 타입
// Animal 구조체에 사용하는 예시
struct Animal {
    var name: String
//    var isMammal: Bool
//    var isReptile: Bool
//    var isbBird: Bool
    var animalType: AnimalType2
    
    init(name: String, animalType: AnimalType2) {
        self.name = name
        self.animalType = animalType
    }
}

enum AnimalType {
    case Mammal
    case Bird
    case Reptile
}

// 연관값을 가지는 열거형
enum AnimalType2 {
    case Mammal(shortFur: Bool)
    case Bird
    case Reptile
}

let lion = Animal(name: "사자", animalType: .Mammal(shortFur: true))
let bear = Animal(name: "곰", animalType: .Mammal(shortFur: false))
print(lion)
print(lion.animalType)

// 열거형을 이용한 분기 처리
switch lion.animalType {
case .Mammal(let shortFur):
    print("\(lion.name)은 포유류이며 털이 \(shortFur ? "짧습니다." : "깁니다.")")
case .Bird:
    print("\(lion.name)은 조류입니다.")
case .Reptile:
    print("\(lion.name)은 파충류입니다.")
}

// MARK: - 오류 처리
// guard 문법
// if문과 비슷하지만 조건이 참일 때의 수행부는 없고 else만 존재
// guard 조건 else {
//    else 일 때 실행되는 코드
//.   return / throw / break / continue

// 스위프트에서 오류는 Error라는 포로토콜을 준수하는 타입의 값을 통해 표현

// Error 프로토콜과 주로 열거형을 통해 오류를 표현
enum ErrorType: Error {
    case error1
    case error2
    case error3
}

// 자판기 동작 오류 종류를 표현한 예시
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class VendingMachine {
    let itemPrice = 100
    var itemCount = 5
    var deposited = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        deposited += money
        print("\(money)원 받음")
    }
    
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        // 구매 수량이 잘못 입력된 경우
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        // 구매 수량보다 미리 넣어둔 돈이 적은 경우
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        //
        guard numberOfItemsToVend >= itemCount else {
            throw VendingMachineError.outOfStock
        }
        let totalPrice = numberOfItemsToVend * itemPrice
        deposited -= totalPrice
        itemCount -= numberOfItemsToVend
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 생성
let machine = VendingMachine()
var result: String?

// 에러 처리
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("잘못 입력")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)이 부족")
} catch VendingMachineError.outOfStock {
    print("재고 없음")
}

// swtich-case 문을 이용한 에러 처리
do {
    try machine.receiveMoney(300)
} catch let error {
    switch error {
    case VendingMachineError.invalidInput: print("잘못 입력")
    case VendingMachineError.insufficientFunds(let moneyNeeded): print("돈 부족")
    case VendingMachineError.outOfStock: print("재고 없음")
    default: print("알 수 없는 오류")
    }
}

// 케이스 별로 구분하지 않은 에러 처리
do {
    try machine.receiveMoney(10000)
} catch {
    print(error) // 에러가 캐치될 때 원시값의 변수명이 출력된다.
}

do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}
print(result)

// try?와 try!
// 별도의 오류 처리 결과를 통보받지 않고 오류가 발생했으면 결과값을 nil로 돌려받을 수 있다. 정상 동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받는다.
//result = try? machine.vend(numberOfItems: 1)
//print("result: \(result)")
//
//result = try! machine.vend(numberOfItems: 1)
//print("result: \(result)")

// try? 옵셔널 반환
try machine.receiveMoney(1000)
if let result = try? machine.vend(numberOfItems: 2) {
    print("result: \(result)")
} else {
    print("정상 작동")
}


// MARK: - 접근 제어 (Access)
/** 접근 제어자 키워드
 - 위로 갈 수록 개방적. 아래로 갈 수록 제한적
 open
 public
 internal
 filePrivate
 private
 */

// open
//  - 클래스와 클래스 멤버(메서드, 프로퍼티 등)에 적용된다.
//  - 클래스 적용 가능하지만, 구조체, 열거형 등에는 적용할 수 없다.
//  - 다른 모듈에서도 상속과 재정의가 가능하다.
//  - 가장 개방적인 접근 수준
open class OpenClass {
    open func openMethod() {
        print("This is an open method.")
    }
}

// public
//  - 외부 모듈에서 접근 가능하지만 상속과 재정의는 불가하다.
//  - 일반적으로 api를 공개할 때 사용한다.
public class PublicClass {
    open func publicMethod() {
        print("This is an public method.")
    }
}

// internal (기본 수준)
//  - 동일 모듈 내에서만 접근 가능하다.
//  - 명시적으로 접근제어 키워드를 선언하지 않으면 기본값은 internal이다.
internal class InternalClass {
    open func internalMethod() {
        print("This is an internal method.")
    }
}

// fileprivate
fileprivate class FilePrivateClass {
    fileprivate func doSomething() {
        print("This is fileprivate.")
    }
}

// private
//  - 동일한 선언 블록 안에서만 접근 가능하며, 확장(Extension)에서도 접근할 수 없다.
// - 가장 제한적인 접근 수준.
private class PrivateClass {
    private var secret = "Top Secret"
    
}


// 접근 제어 규칙
// Higher Level 제한: 특정 코드가 더 제한적인 접근 수준을 가진 코드(예: private)보다 높은 접근 수준을 가질 수 없습니다
public class PublicClass2 {
    private var privateProperty = "Secret" // 가능
    
    // 읽기와 쓰기 따로 접근제어자 지정 할 수 있다.
    public private(set) var second = "Second"
}

private class PrivateClass2 {
    public var publicProperty = "Exposed" // 오류 발생
    

}
