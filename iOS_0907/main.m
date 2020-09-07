
#import <Foundation/Foundation.h>

// Class Type
//  Java, C#: Reflection
//      ObjC: Introspection
// => 런타임에 클래스의 정보 등을 탐색하는 목적으로 사용한다.

@interface Car : NSObject
- (void)go;
@end

@interface Truck : Car
@end

@implementation Car
- (void)go {
  printf("Car go\n");   // 1
}
@end

@implementation Truck
- (void)go {
  printf("Truck go\n"); // 2
}
@end

@interface Person : NSObject
// - (void)go;
@end

@implementation Person
//- (void)go {
//  printf("Person go\n");
//}
@end


// 1. ObjC는 '동적 바인딩'을 합니다.
//  정적 바인딩: 컴파일러가 어떤 함수를 호출할지 결정하는 것
//            C, C++
//  동적 바인딩: 런타임에 어떤 객체 타입인지를 확인해서, 함수를 호출하는 것
//            Java, C++(virtual)

// 2. 많은 객체 지향 언어들은 상속 관계를 통해 다형성을 구현합니다.
//  - ObjC, Javascript, Go
//  => Duck Typing(덕 타이핑)
//    : 동일한 메소드를 가지고 있다면, 다형성을 구현하는 것이 가능하다.

// 3. [object respondsToSelector:@selector(go)]
//  - receiver(object)가 go 메시지를 수신할 수 있는지 체크한다.

void go(id object) {
  if ([object respondsToSelector:@selector(go)])
    [object go];
}

int main() {
  Car* car = [Truck new];
  // 1. Class를 얻는 3가지 방법
  //  1) 타입을 통해서 얻는다.
  Class c1 = [Truck class];
  
  //  2) 객체를 통해서 얻는다.
  Class c2 = [car class];
  
  //  3) 문자열을 통해서 얻을 수 있다.
  //   => 실패의 가능성이 있습니다.
  Class c3 = NSClassFromString(@"Car");
  
  // 2. Class의 용도
  //  1) 런타임에 객체의 타입을 확인하는 목적으로 사용합니다.
  if ([Car class] == [car class]) {
    printf("Car 타입입니다..\n");
  }
  
  if ([Truck class] == [car class]) {
    printf("Truck 타입입니다..\n");
  }
  
  // ObjC: isKindOfClass
  if ([car isKindOfClass:[Car class]]) {
    printf("Car의 자식입니다.\n");
  }
  // Java: instanceOf
  // if (car instanceOf Car) { -> true
  
  //  2) 동적 생성
  // Intent intent = new Intent(this, MainActivity.class);
  // startActivity(intent);
  
  Class carClass = [car class];
  Car* p = [carClass new];
  // => iOS에서 사용자가 만든 클래스를 프레임워크에서 생성할 때 사용하는 기술
  
  
  
//  go([Car new]);
//  go([Truck new]);
//  go([Person new]);
//
//  Car* car = [Truck new];  // ?
//  [car go];
}


// id: Objective C의 객체를 참조하는 타입
// NSObject* 와는 다릅니다.

// 다형성?
//  : go라는 메소드를 통해 각각의 객체가 다른 동작을 수행한다.

