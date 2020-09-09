import Foundation

// 객체가 참조 타입이든 값 타입이든 상관없이 다형성을 구현하는 것이 가능하다.
protocol UserProtocol {
  // 프로토콜을 구현하는 모든 클래스는 name 프로퍼티에 대해서 getter를 제공해야 한다.
  var name: String {
    get
  }
  
  func hello(message: String)
}

class Student: UserProtocol {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func hello(message: String) {
    print("hello - \(message)")
  }
}

struct User: UserProtocol {
  var name: String {
    get {
      return "struct User"
    }
  }
  
  func hello(message: String) {
    print("User hello - \(message)")
  }
}

var user: UserProtocol?
user = Student(name: "Student")
user = User()

var a = Student(name: "")
a.go()


user?.hello(message: "OK")

// extension을 이용하면, Protocol에 구현을 추가할 수 있습니다.
extension UserProtocol {
  func go() {
    print("go...")
  }
}


// ObjC Category
//  => 기존 클래스에 새로운 메소드를 추가하는 기능
//  => Swift Extension
//  => Kotlin Extension Function
//    - Android KTX

// Framework이 제공하는 클래스 - 사용자가 수정할 수 없습니다.
class UIColor {
}
//-----------------
// Extension
//   1. RxSwift / RxCocoa (비동기)
//   2. Kingfisher - Image

extension UIColor {
  // stored properties 만들 수 없다.
  // => computed property 만들 수 있다.
  static var red: Int {
    get {
      return 42
    }
  }
  
  static func random() -> UIColor {
    return UIColor()
  }
  
  
}

let color = UIColor.random()
// let color2 = color.red
let red = UIColor.red
