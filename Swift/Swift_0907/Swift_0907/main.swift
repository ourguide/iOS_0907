
import Foundation

// Dictionary<String, Any> -> JSON Object
// {
//   "name": "Tom",
//   "age": 42
// }

// Dictionary<String, Any> -> [String:Any]

func foo(a: Int) {
  // 기존 언어에서 빠른 탈출 구문으로 변경하기 위해서는 기존 조건의 반대로 작성해야 한다.
  guard a > 0 && a <= 10 else {
    return
  }
  
  // a
  
}


// guard: early exit
//   => 조건문의 중첩을 방어할 수 있다.

func printJSON(_ json: [String: Any]) {
  // 1. 키 값에 해당하는 value가 존재하지 않을 수 있기 때문에, Optional이 반환된다.
  // let name = json["age"]! as! String
  //           Any?! -> Any -> as! -> String
  // print(name)

  if let name = json["name"] as? String, let age = json["age"] as? Int {
    print("\(name) \(age)")
  }
  
  guard let name = json["name"] as? String, let age = json["age"] as? Int else {
    return
  }
  
  // Optional Binding을 지원한다.
  print("\(name) \(age)")
}

let user: [String: Any] = [
  "name": "Tom",
  "age": 42
]

printJSON(user)
