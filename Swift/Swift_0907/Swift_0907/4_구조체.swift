import Foundation

// Objective C
//   - Reference Type: 객체
//   - Built-in Type: int, double, char

// Swift는 모든 것이 객체(object) 입니다.
//  => 객체 = 속성(property) + 메소드
//   1) Reference Type - class
//     : 힙에 생성된다.
//       ARC(참조 계수)에 의해 수명 관리가 된다.

//   2) Value Type     - struct
//     : 어떤 컨텍스트에서 생성 했는지에 따라 위치가 결정된다.
//       스택에 생성할 경우, 메모리 생성 해지의 비용이 거의 없다.

// 구조체(struct)
struct User2 {
  var name: String
  var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

class User {
  var name: String
  var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

// 클래스 객체는 let으로 지정되도, 불변이 아니다.
let cUser = User(name: "Tom", age: 42)
cUser.name = "Bob"


// 구조체 객체는 let으로 지정되면, 불변이다.
let sUser = User2(name: "Tom", age: 42)
// sUser.name = "Bob"
let arr1: [String] = [];  // 불변
var arr2: [String] = [];  // 가변

//-----------------------------------

struct Point {
  let x: Int
  let y: Int
  
  var name: String
  
  // 구조체는 불변 객체가 권장됩니다.
  // 기본적으로 메소드 안에서 필드의 값을 변경할 수 없습니다. - mutating
  // - mutating 함수는 var 에서만 호출 가능합니다.
  mutating func foo() {
    name = "Bob"
  }
}

// 1. struct 에서는 초기화 메소드를 제공하지 않을 경우,
//    자동으로 멤버를 초기화하는 멤버 와이즈 초기화 메소드가 생성됩니다.
let point = Point(x: 10, y: 24, name: "Positon")
// point.name = "Bob"
// point.foo()

print(point)
