
import Foundation

// 2014: 1.0
// 2015: 2.0
// 2016: 3.0
// 2017: 4.0
// 2018: 5.0
// 2020: 5.2

// 언어의 특징
// 1) 안정성(Safe) - Optional(Nullable)
// 2) 성능(Fast)
// 3) 표현성(Expressive) - 사용하기 편하고 명확한 구문

// 클래스 기본
// 1. NSObject의 자식으로 클래스를 만들지 않아도 됩니다.
// 2. 필드를 제공하지 않고, 프로퍼티만 제공합니다.

// var: 가변 변수(getter / setter)
// let: 불변 변수(getter)

// @property(nonatomic, strong, readwrite) NSString *name;
// => var name: String

// @property(nonatomic, strong, readonly) NSString *name;
// => let name: String

// @property(nonatomic, weak, readwrite) NSString *name;
// => weak var name: String

// 3. 더 이상 세미 콜론을 사용하지 않습니다.

class Car {
  var name: String
  var speed: Int
  
  init(name: String, speed: Int) {
    self.name = name
    self.speed = speed
  }
  
  func go(a: Int, b: Int, speed: Int, color: Int) {
    // String Interpolation(보간법)
    print("go - \(a) \(b) \(speed) \(color)")
  }
  
  func add(_ a: Int, _ b: Int) -> Int {
    return a + b
  }
  
  func sub(lvalue a: Int, rvalue b: Int) -> Int {
    return a - b;
  }
}

let car = Car(name: "Tom", speed: 42)
// car = Car(name: "Bob", speed: 10)

car.name = "Bob"  // Setter
print(car.name)   // Getter

car.go(a: 10, b: 20, speed: 30, color: 40)

// print(car.add(a: 10, b: 20))
print(car.add(10, 20))
print(car.sub(lvalue: 10, rvalue: 20))






