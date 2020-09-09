import Foundation

// 함수형 프로그래밍
// 1. Swift 에서는 함수의 인자가 let으로 전달된다.
// 2. inout
//    - 함수를 통해 인자에 부수효과를 필요로 하는 경우 사용한다.
func swap(_ a: inout Int, _ b: inout Int) {
  let temp = a
  a = b
  b = temp
}

// var a = 10
// var b = 20
// swap(&a, &b)   // inout => &를 붙여서 전달해야 한다.

// Array<Int>        -> [Int]
// Map<String, Int>  -> [String:Int]

// for (int i = 0 ; i < n - 1; i++)

// 스위프트는 함수의 시그니처에 의해서 함수의 타입이 결정됩니다.
//      => 인자정보, 반환타입

// (Int, Int) -> Bool
func compare1(_ a: Int, _ b: Int) -> Bool {
  return a > b
}

// (Int, Int) -> Bool
func compare2(_ a: Int, _ b: Int) -> Bool {
  return a < b
}

func sort(_ x: inout [Int], comparator: (Int, Int) -> Bool) {
  for i in 0..<x.count - 1 {
    for j in i + 1..<x.count {
      // if x[i] > x[j] {
      if comparator(x[i], x[j]) {
        x.swapAt(i, j)
      }
    }
  }
}

var x = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]

// 함수형 프로그래밍
// - 람다(Lambda)   - 코드 블록을 참조하는 기술
// - 클로저(Closure) - 외부의 변수를 암묵적으로 캡쳐하는 기술

// Swift - 아래 기술을 '클로저'라고 부릅니다.
// 1. 기존 함수를 참조하는 것이 가능하다.
sort(&x, comparator: compare2)

// 2. 코드 조각(람다)을 전달하는 것도 가능합니다.
sort(&x, comparator: { a, b in
  a < b
})

// 3. 만약 전달되는 코드 블록의 한줄이라면, return을 생략할 수 있다.
sort(&x, comparator: { a, b in
  a < b
})

// 4. 인자의 이름을 생략하고, $0 $1 $2 $3 인자를 참조할 수 있습니다.
sort(&x, comparator: {
  $0 < $1
})

// 5. 함수의 마지막 인자가 함수인 경우, 블록을 함수의 호출 괄호 밖에 작성할 수 있습니다. - tailing lambda
sort(&x) {
  $0 < $1
}

// 6. 타입을 명시적으로 지정한다.
sort(&x) { (a: Int, b: Int) -> Bool in
  a > b
}

print(x)

let arr = [ "Tom", "Bob", "Alice" ]

// map(tranform) - 배열 내부의 요소의 값을 변환해서 새로운 컬렉션을 생성한다.
// filter         - 배열 요소 중 조건에 부합되지 않는 요소는 필터한다.
let result = arr.map { e -> Int in
  e.count
}.filter { e -> Bool in
  e >= 5
}

print(result)


