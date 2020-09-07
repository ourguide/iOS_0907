#import <Foundation/Foundation.h>

@interface Car : NSObject {
  int _red;
  int _green;
  int _blue;
}

- (id)initWithRed:(int)red green:(int)green blue:(int)blue;

+ (Car*)blueCar;
+ (Car*)redCar;

@end

@implementation Car

// 정적 팩토리 메소드 => 편의 생성자
//                  : 내부적으로 지정 초기화 메소드를 통해 객체를 편리하게 생성하는 클래스 메소드
+ (Car*)blueCar {
  return [[[Car alloc] initWithRed:0 green:0 blue:255] autorelease]; // !!
}

+ (Car*)redCar {
  return [[[Car alloc] initWithRed:255 green:0 blue:0] autorelease];
}

- (id)initWithRed:(int)red green:(int)green blue:(int)blue {
  self = [super init];
  if (self) {
    _red = red;
    _green = green;
    _blue = blue;
  }
  return self;
}

- (void)dealloc {
  printf("Car 객체 파괴..\n");
  
  [super dealloc];
}

@end

// * 편의 생성자를 통해 생성되는 객체들은 Auto Release Pool을 통해 수명을 관리하자.
// => 프로그램 내에는 반드시 1개의 autoreleasepool이 존재해야 한다.

int main() {
  
  @autoreleasepool { // [[NSAutoreleasePool alloc] init];
  
    @autoreleasepool {
        Car* blueCar = [Car blueCar];
    }
    
    printf("------blueCar-----\n");
    Car* redCar = [Car redCar];
    
  } // [pool release];
  

#if 0
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init]; // pool 생성
  
  Car* blueCar = [Car blueCar];
  Car* redCar = [Car redCar];
  
  [pool release];
  // pool에 등록된 모든 객체에 대해서, release를 보낸다.
#endif
  
  
#if 0
  Car* blueCar = [[Car alloc] initWithRed:0
                                    green:0
                                     blue:255];
  
  Car* redCar = [[Car alloc] initWithRed:255
                                   green:0
                                    blue:0];
#endif
}

