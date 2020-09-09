import Foundation

// Swift
// 객체(속성, 메소드)
// 1. class  - Reference Type
// 2. struct - Value Type
// 3. enum   - Value Type

// 1. enum 기본 사용법
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

// foo(school: .middle, gender: .male)

//-----------------------------

// 2. Swift의 enum은 원시값(rawValue)을 지원합니다.
//  - 특정 타입으로 지정된 값을 가집니다.
//   String: 각 항목의 이름
//   Int, Double: 첫번째 항목을 0을 기준으로 1씩 증가합니다.

enum Number : String {
  case one
  case two
  case three
  case four
}

let num: Number = .two

print(num.rawValue)

// 3. 연관값(Associated Value)
enum NetworkError {
  case invalidParameter(String, String)
  case timeout(Double)
  case internalError(String)
}

// let error: NetworkError = .invalidParameter("a parameter", "잘못된 형식입니다")
// let error: NetworkError = .timeout(3.14)
let error: NetworkError = .internalError("서버가 구동되고 있지 않습니다.")

// 연관값 처리 방법 1 - if case
if case .invalidParameter(let param, let message) = error {
  print("InvalidParameter - \(param)/\(message)")
}

if case let .invalidParameter(param, message) = error {
  print("InvalidParameter - \(param)/\(message)")
} else if case let .timeout(sec) = error {
  print("Timeout - \(sec) seconds")
} else if case let .internalError(message) = error {
  print("InternalError - \(message)")
}z

// 처리 방법 2 - switch / case
switch error {
case let .invalidParameter(param, message):
  print("InvalidParameter - \(param)/\(message)")
case let .timeout(sec):
  print("Timeout - \(sec) seconds")
case let .internalError(message):
  print("InternalError - \(message)")
}
