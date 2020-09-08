// 메모리
// 1. 객체의 수명을 관리하는 기술
//  => '참조 계수 기반'으로 객체의 수명을 관리합니다.

#import <Foundation/Foundation.h>

@interface Car : NSObject
@end

@implementation Car

- (void)dealloc {
  printf("Car dealloc!\n");
  
  // MRC 에서는 부모의 dealloc을 명시적으로 호출해야 합니다.
  [super dealloc];
}

@end

// 2. retainCount
//  => 현재 객체의 참조 계수를 확인한다.
//  => MRC에서만 사용할 수 있다.
//    - retain: 참조 계수를 증가
//    - release: 참조 계수를 감소


// Java vs ObjC
// 참조 계수를 구현하는 기술
// - Java(VM): 별도의 런타임이 참조 계수를 관리한다.
//   => 런타임에 GC가 동작하므로, 성능 저하의 원인이 될 수 있다.
//   => 런타임에 파악하기 때문에, 거의 제대로 동작한다.

// - Obj / Swift(ARC): 컴파일러가 코드를 분석해서, 참조 계수를 관리하는 코드를 삽입한다.
//   => 런타임에 별도로 동작하는 것이 아니라, 컴파일 타임에 삽입하기 때문에, 성능 저하가 없다.
//   => 객체가 더이상 사용되지 않는 시점에 바로 파괴된다.
//   => 컴파일러가 제대로 파악하지 못하는 코드에 대해선, 누수의 위험성이 있다.

int main() {
  // 1) 객체 생성시 참조 계수는 1 입니다.
  Car* p1 = [Car new];
  printf("Ref count: %ld\n", [p1 retainCount]);  // 1
  
  // 2) 객체의 포인터 대입 후, 참조 계수는 증가해야 합니다.
  Car* p2 = p1;
  [p2 retain];
  printf("Ref count: %ld\n", [p1 retainCount]);  // 2
  
  [p1 release];
  printf("Ref count: %ld\n", [p1 retainCount]);  // 1
  
  [p2 release];                                  // 1 -> 0 (dealloc)
  // printf("Ref count: %ld\n", [p2 retainCount]);
  
  printf("main end...\n");
}
