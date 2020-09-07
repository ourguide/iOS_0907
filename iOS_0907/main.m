// 초기화 메소드
//  => 생성자

#import <Foundation/Foundation.h>

@interface Car : NSObject {
  int _color;
}

// 초기화 메소드
- (id)init;
- (id)initWithColor:(int)color;

// 객체가 파괴되는 시점에 호출되는 함수입니다.
- (void)dealloc;

- (int)color;

@end

@implementation Car

- (void)dealloc {
  printf("Dealloc!\n");
}

- (int)color {
  return _color;
}


// NULL - #define NULL (void*)0
// nil  - #define nil  (id)0

// * id: 모든 객체를 참조할 수 있는 타입.

// self에 대한 초기화는 초기화함수에서 이루어집니다.
- (id)init {
  // 1. 부모의 '지정' 초기화 메소드를 명시적으로 호출합니다.
  self = [super init];
  
  // 2. 부모의 초기화 메소드가 실패하지 않았다면, 자신의 필드를 초기화한다.
  if (self != nil) {
    _color = 42;
  }
  
  // 3. self를 반환한다.
  return self;
}

// 지정 초기화 메소드 - Designated Initializer
- (id)initWithColor:(int)color {
  self = [super init];
  
  if (self) {
    _color = color;
  }
  
  return self;
}

@end

@interface Truck : Car {
  int _speed;
}

- (id)initWithSpeed:(int)speed color:(int)color;
- (int)speed;

@end

@implementation Truck

- (int)speed {
  return _speed;
}

- (id)initWithSpeed:(int)speed color:(int)color {
  self = [super initWithColor:color];
  if (self) {
    _speed = speed;
  }
  return self;
}

@end


// new
//  1) 객체의 메모리를 할당한다. - alloc
//  2) init 함수를 통해 객체의 필드를 초기화한다.
// * new는 init을 호출하도록 약속되어 있습니다.

// init이 아닌 사용자가 정의한 초기화 메소드를 객체 생성시 사용하기 위해서는,
// 객체의 메모리 할당과 초기화 메소드를 직접 호출해야 한다.
//  => 2단계 생성 패턴

// ObjC는 메모리 관리가 컴파일러에 의해 삽입된 코드에 의해 관리됩니다.
// => ARC(Auto Reference Counting)
// => MRC(Manual Reference Counting)

// => VM(Virtual Machine) - Deprecated

int main() {
  // Car* car = [Car new];
  Car* car = [[Car alloc] init];
  printf("%d\n", [car color]);
  
  Car* car2 = [[Car alloc] initWithColor:100];
  printf("%d\n", [car2 color]);
  
  // Truck* truck = [[Truck alloc] initWithSpeed:42 color:100];
  Truck* truck = nil;
  printf("%d\n", [truck color]); // ?
  
  // nil객체에 메소드를 호출하면, 크래시가 발생하지 않는다.
}


