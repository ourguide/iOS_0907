
#import <Foundation/Foundation.h>

// 1. weak / unsafe_unretaind - 상호참조에 의한 메모리 누수를 해결할 수 있습니다.
// 2. weak은 autoniling을 지원하기 때문에, 안전하게 사용할 수 있다.
//    => 성능이 다소 차이가 있다.(거의 없다)
// 3. 메모리 관련 지정이 없을 경우
//    ARC: strong이 기본입니다.
//    MRC: assign이 기본입니다.

@interface Node : NSObject
@property(strong) Node* next;
@end

@implementation Node
- (void)dealloc {
  printf("Node dealloc\n");
}
@end

// 상호 참조에 의한 누수가 발생하는 예제입니다.
void foo() {
  Node* p1 = [Node new];
  Node* p2 = [Node new];
  
  p1.next = p2;
  p2.next = p1;
}

int main() {
  // NSDate* startTime = [NSDate date];
  foo();
  // printf("%lf\n", [startTime timeIntervalSinceNow]);
}





