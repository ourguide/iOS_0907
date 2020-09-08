#import <Foundation/Foundation.h>

#import <objc/message.h>
// KVC
//  : Key-Value Coding
//  - 프로퍼티의 이름을 키 값으로 해서, 객체에서 사전처럼 값을 읽거나 변경할 수 있는 기능.

@interface Person : NSObject

@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) int age;
// ...

@end

@implementation Person
@end

int main() {
  Person* p = [Person new];
  p.name = @"Tom";
  p.age = 42;
  
  //--------
  // 사용자로부터 입력을 받는다.
  NSString* input = @"age";
  NSLog(@"%@", [p valueForKey:input]);
  
  // KVC가 없다면...
  if ([input isEqualToString:@"name"]) {
    NSLog(@"name: %@", p.name);
  } else if ([input isEqualToString:@"age"]) {
    NSLog(@"age: %d", p.age);
  }
  
  if (class_getProperty([p class], "name")) {
      printf("name 프로퍼티 존재함\n");
  } else {
      printf("name 프로퍼티 존재하지 않음\n");
  }
}
