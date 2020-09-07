// 프로퍼티(Property)

#import <Foundation/Foundation.h>

/*
@interface Car : NSObject {
  int _color;
}

// Getter
- (int)color;
// Setter
- (void)setColor:(int)color;

@end

@implementation Car

- (int)color {
  printf("Getter\n");
  return _color;
}

- (void)setColor:(int)color {
  printf("Setter\n");
  _color = color;
}

@end
*/

@interface Car : NSObject

@property int color;
// 1. field: _color
// 2. Accessor Method : Getter(color) / Setter(setColor)

@end

@implementation Car
@end

// 1. dot 연산자를 이용해서, setter / getter를 호출할 수 있습니다.
// => 네이밍컨벤션이 매우 중요합니다.

// 2. 프로퍼티(Property)
// => 접근자 메소드(Getter + Setter)와 필드를 자동으로 생성하는 문법이다.

int main() {
  Car* car = [[Car alloc] init];
  
  // [car setColor:100];
  car.color = 100;
  
  // printf("%d\n", [car color]);
  printf("%d\n", car.color);
}
