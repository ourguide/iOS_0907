import Foundation

// Swift
// 객체(속성, 메소드)
// 1. class  - Reference Type
// 2. struct - Value Type
// 3. enum   - Value Type

// 연관된 항목을 묶어서 표현할 수 있는 타입입니다.
enum School {
  case primary
  case elementary
  case middle
  case high
}

// 한 줄로 표현하는 것도 가능합니다.
enum Gender {
  case male, female
}

func foo(school: School, gender: Gender) {
  // break가 존재하지 않습니다.
  // fallthrough: 아래 case를 수행할 수 있습니다.
  switch school {
  case .elementary:
    print("elementary")
  case .middle:
    print("middle")
    fallthrough
  case .primary:
    print("primary")
    fallthrough
  case .high:
    print("high")
  }
}

foo(school: .middle, gender: .male)
