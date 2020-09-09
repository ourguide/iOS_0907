

import Foundation

// KVO: 값의 변경에 대한 이벤트
class User {
  var name: String = "Tom" {
    didSet {
      print("didSet - \(oldValue) -> \(name)")
    }
    willSet {
      print("willSet - \(newValue)")
    }
  }
}

let user = User()
user.name = "Bob"
user.name = "Alice"
