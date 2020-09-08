
import Foundation

// Optional
// 1. nil(null) 참조는 많은 오류의 원인이 됩니다.
// 2. 스위프트에서는 일반적인 타입에 nil을 대입할 수 없습니다.
// 3. 값을 읽거나 변경하기 위해서는, nil 체크가 필요합니다.

// var a: Int = 42
// a = nil               // Compile error!

// Int?: Optional Type
//    -> nil이 가능성이 있는 변수 타입

var a: Int? = 42
var b: String? = "Tom"
// a = nil

// Optional 타입에 !를 사용하면, 강제적으로 Optional을 제거할 수 있다.
if a != nil {
  print(a!)     // 강제적으로 Optioanl을 제거하는 ! 연산자는 사용하지 않는 것이 좋습니다.
}

// Optional 변수가 nil이 아니면, 값을 얻어오는 구문
if let a = a {
  if let b = b {
      print("\(a) \(b)")
  }
}

if let a = a, let b = b {
  print("\(a) \(b)")
}

class Person {
  func hello() {
    print("Person hello")
  }
}

var c: Person? = nil
// c.hello()

if let person = c {
  person.hello()
}

// Optional Chaining
c?.hello()

// Optional 원리
// - Swift는 enum을 통해서 구현하고 있습니다.
var p: Optional<Person> = Person()
switch p {
case .none:
  print("Nil 입니다")
case .some(let value):
  print("Value - \(value)")
}

func foo(a: Int) {
  
}

var d: Int! = 42
foo(a: d)

//    대입
// Int  -> Int?  허용
// Int? -> Int   허용 X
// Int! -> Int   허용(위험하다)

// var p: Person? = nil


// Swift에서 타입을 표현하는 방법 3가지
// 1. Int
//  -> nil을 대입할 수 없다.
// 2. Int?
//  -> 값을 얻기 위해서는, if let 구문 등을 통해 체크해서 사용해야 한다.
// 3. Int! : 암시적 추출 타입
//  -> nil 가능성이 있는 타입이지만, 체크를 강제하지 않는다.
//  => 일반적으로 사용하지 않는 것이 좋다.
//  => 체크를 강제하지 않는다.



//var b: Int = 100
//print("\(a) \(b)")
