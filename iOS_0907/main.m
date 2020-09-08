#import <Foundation/Foundation.h>

// 해결 방법
// 1. 복사
//  - NSCopying
//  - copyWithZone:
//    alloc -> allocWithZone:

// 2. 불변 객체
// - readwrite: getter + setter
// - readonly: getter

@interface Person : NSObject<NSCopying>
// setter를 제공하고 싶지 않다면, readonly를 지정하면 됩니다.
@property(strong, nonatomic, readonly) NSString* name;
@property(assign, nonatomic, readonly) int age;

- (instancetype)initWithName:(NSString*)name age:(int)age;

@end

@interface Company : NSObject
// @property(strong, nonatomic) Person* person;
@property(copy, nonatomic) Person* person;
// setter에서 복사본을 생성하고, 소유합니다.

- (instancetype)initWithPerson:(Person*)person;
@end

@implementation Person

// NSCopying
- (id)copyWithZone:(NSZone *)zone {
  // zone에 객체를 생성하고, 초기화하면 됩니다.
  return [[Person allocWithZone:zone] initWithName:_name age:_age];  // !!!
}

- (NSString *)description {
  return [@{
    @"name": _name,
    @"age": [NSNumber numberWithInt:_age]
  } description];
}

- (instancetype)initWithName:(NSString*)name age:(int)age {
  self = [super init];
  if (self) {
    _name = name;
    _age = age;
  }
  return self;
}

@end

@implementation Company
- (instancetype)initWithPerson:(Person*)person {
  self = [super init];
  if (self) {
    // _person = person;
    _person = [person copy]; // !!
  }
  return self;
}

- (NSString *)description {
  return [@{
    @"person": _person
  } description];
}
@end

int main() {
  Person *person = [[Person alloc] initWithName:@"Tom" age:42];
  NSLog(@"%@", person);
  
  Company *company = [[Company alloc] initWithPerson:person];
  
  //----
  Person *person2 = [[Person alloc] initWithName:@"Tom" age:42];
  company.person = person2;
  // person2.name = @"Bob";
  //----
  NSLog(@"%@", company);
}
