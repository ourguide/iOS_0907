
import Foundation

// 초기화 메소드
// 1. 객체 생성시에 호출되는 함수 입니다.
// 2. 객체 내부의 프로퍼티가 Optional이 아니면, 반드시 초기화 메소드를 통해 초기화해주어야 합니다.

class Car {
  var speed: Int
  var color: Int
  
  // 편의 생성자 - 지정 초기화 메소드를 호출하는 초기화 메소드
  //  : ObjC - class method
  convenience init(speed: Int) {
    self.init(speed: speed, color: 0)
  }
  
  // 지정 초기화 메소드(Designated Initializer)
  // : 클래스의 모든 필드를 온전히 초기화하는 초기화 메소드
  init(speed: Int, color: Int) {
    self.speed = speed
    self.color = color
  }
}

class Truck : Car {
  var name: String

  init(speed: Int, color: Int, name: String) {
    // 1. 자신의 필드를 초기화 한다.
    self.name = name
    // 2. 부모의 지정 초기화 메소드를 호출한다.
    super.init(speed: speed, color: color)
  }
}

// - ObjC 에서는 부모가 제공하는 초기화 메소드를 상속했지만,
//   1) 초기화를 메소드를 정의한 경우, 자식 클래스는 부모의 초기화 메소드를 상속되지 않는다.
//   2) 초기화를 메소드를 정의하지 않은 경우, 부모가 제공하는 초기화 메소드와 편의 초기화 메소드를 상속한다.
// let p2 = Truck(speed: 42, color: 100, name: "Tom")

let p1 = Car(speed: 42)
p1.color = 100


class User {
  var name: String
  
  // 자식 클래스가 반드시 해당 초기화 메소드를 가져야 한다. - required
  required init(name: String) {
    self.name = name
  }
}

class Student : User {
  var age: Int
  
  init(name: String, age: Int) {
    self.age = 40
    super.init(name: name)
  }
  
  // 부모 클래스가 요구하는 초기화 메소드를 반드시 구현해야 한다.
  required init(name: String) {
    self.age = 0
    super.init(name: name)
  }
}

class Computer {
  var price: Int
  
  // 실패 가능성이 있는 초기화 메소드를 제공하는 것이 가능합니다. - init?
  init?(price: Int) {
    if (price < 0) {
      // 객체 생성을 실패하고 싶다.
      return nil
    }
    
    self.price = price
  }
}

let computer: Computer? = Computer(price: -1)
if let computer = computer {
  print(computer.price)
}

