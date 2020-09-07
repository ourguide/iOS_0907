// 초기화 메소드
//  => 생성자

#import <Foundation/Foundation.h>

@interface Car : NSObject {
  int _color;
}

// 초기화 메소드
- (id)init;

- (int)color;

@end

@implementation Car

- (int)color {
  return _color;
}


// NULL - #define NULL (void*)0
// nil  - #define nil  (id)0

// * id: 모든 객체를 참조할 수 있는 타입.

// self에 대한 초기화는 초기화함수에서 이루어집니다.
- (id)init {
  // 1. 부모의 초기화 메소드를 명시적으로 호출합니다.
  self = [super init];
  
  // 2. 부모의 초기화 메소드가 실패하지 않았다면, 자신의 필드를 초기화한다.
  if (self != nil) {
    _color = 42;
  }
  
  // 3. self를 반환한다.
  return self;
}

@end

int main() {
  Car* car = [Car new];
  printf("%d\n", [car color]);
}


