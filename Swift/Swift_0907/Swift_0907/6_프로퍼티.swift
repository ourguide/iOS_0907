import Foundation

// Property
// 1. readwrite - var: getter + setter
//    readonly  - let: getter
// 2. atomic / nonatomic 동기화 관련 속성은 더 이상 지원하지 않습니다.
// 3. strong: let a: String
//      weak: weak let a: String
// 4. 프로퍼티 종류
//    1. 저장(Stored) 프로퍼티: Backing Field가 생성되는 프로퍼티
//    2. 연산(Computed) 프로퍼티: Backing Field가 생성되지 않는 프로퍼티
//                   접근자 메소드만 존재하는 프로퍼티
/*     - var
//    3. 타입 프로퍼티: static field
 
@property(nonatomic, strong) int age;
// => _age: Backing 필드
//    getter / setter
*/

class User {
  // static final String
  static let typeName = "User"
  
  var firstName: String
  
  // 저장 프로퍼티에 대해서는 getter / setter를 재정의하기 위해서는 별도의 저장 프로퍼티를 제공해야 한다.
  var _lastName: String
  var lastName: String {
    get {
      return _lastName
    }
    set {
      _lastName = newValue
    }
  }
  
  // 연산형 프로퍼티 - Backing field가 존재하지 않기 때문에, 초기화 메소드를 통해 초기화할 필요가 없다.
  // - 연산형 프로퍼티는 var로 제공한다.
  var fullName: String {
    get {
        return "\(firstName) \(lastName)"
    }
    // set(value) {
    set {
      // setter에 인자를 지정하지 않으면, newValue라는 이름을 통해 전달된다.
      let arr = newValue.split(separator: " ")
      firstName = "\(arr[0])"
      lastName = "\(arr[1])"
    }
  }
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self._lastName = lastName
  }
}

let user = User(firstName: "Gildong", lastName: "Hong")
user.fullName = "Soonshin Lee"
// print(user.fullName)
// print(User.typeName)

class Image {
  init() {
    print("Image 객체 생성 - 느리다")
  }
}

// lazy var: 지연 초기화
class Person {
  lazy var image: Image = Image()
  // 객체가 생성되는 시점에 초기화 하는 것이 아니라, 처음 접근되는 시점에 초기화하는 것이 좋다.
  // => 지연 초기화
}

print("프로그램 시작")
let p = Person()
print("Person 객체 생성")
print(p.image)
