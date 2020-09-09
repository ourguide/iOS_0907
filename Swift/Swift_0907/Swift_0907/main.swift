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

print(x)
