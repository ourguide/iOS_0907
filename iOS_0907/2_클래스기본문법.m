// 클래스 기본 문법
#import <Foundation/Foundation.h>

// 1. ObjC는 Smalltalk 언어의 영향을 받았습니다.
//   => 다른 언어와 용어적인 차이가 있습니다.

// 클래스 선언부 - .h(헤더 파일)
// Java
#if 0
// Object의 자식 클래스로 만들어집니다.
class Car {
  int speed;  // private
}
#endif

// NSObject: ObjC 언어의 최상위 클래스
@interface Car : NSObject {
  // 필드를 정의할 수 있습니다.
  // - 필드에 접근 지정 레벨의 기본은 protected 입니다.
@public
  int _speed;
@private
  int _color;
@protected
}

// Obj C는 메소드에 접근 지정레벨을 제공할 수 없습니다.
// 메소드의 선언부
- (void)go;

// 클래스 메소드의 선언부
+ (void)foo;

@end

// #import "XXX.h"

// 클래스 정의부 - .m(소스 파일)
@implementation Car

// 메소드의 구현부
- (void)go {
  printf("go - %d\n", _speed);
}

+ (void)foo {
  printf("foo\n");
}

@end

int main() {
  // Car 클래스에 new 메세지를 보낸다.
  // - receiver: Car
  // - new: selector
  Car* car = [Car new];
  car->_speed = 42;
  
  // car->_color = 100;
  [car go];
  [Car foo];
  
  printf("%d\n", car->_speed);
}






