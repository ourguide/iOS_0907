import Foundation

// ObjC의 ARC의 정책은 Swift도 동일합니다.
class Car {
  // - (void)dealloc
  // 객체가 파괴되는 시점에 수행되는 블록을 정의할 수 있습니다.
  deinit {
    print("Car deinit")
  }
}

var p1: Car? = Car()   // 객체 생성시 참조 계수 - 1
var p2: Car? = p1      // 참조 변수 대입시 참조 계수 증가 - 2

print("1....")
p1 = nil               // 2 -> 1
print("2....")
p2 = nil               // 1 -> 0  => deinit!
print("3....")

class Node {
  weak var next: Node?
  // 약한 참조
  //  - autoniling
  //  - weak 프로퍼티는 반드시 Optional 이어야 합니다.
  //  0bjC
  //   weak               -> weak
  //   unsafe_unretained  -> unowned
  
  deinit {
    print("Node 객체 파괴")
  }
}

var n1: Node? = Node()
var n2: Node? = Node()
n1?.next = n2
n2?.next = n1

n1 = nil
n2 = nil




