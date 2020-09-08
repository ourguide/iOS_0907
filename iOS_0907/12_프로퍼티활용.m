
#import <Foundation/Foundation.h>

@class Phone;
@interface Person : NSObject

@property(strong, nonatomic) NSString* firstName;
@property(strong, nonatomic) NSString* lastName;

@property(strong, nonatomic) Phone* phone;

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;
- (id)initWithPhone:(Phone*)phone;

- (NSString*)fullName;
- (void)setFullName:(NSString*)fullName;

- (void)foo;

@end

// => Effective Objective C
// 1. 객체 내부에서 인스턴스 변수에 접근할 때는 읽을 때는 직접 접근하고, 쓸때는 접근자 메소드를 이용하는 것이 좋습니다.
//  - 인스턴스 변수의 소유권이 자신일 경우 - !!
//   : 초기화 메소드 안에서 값을 설정할 때는 setter를 이용하는 것이 아니라, '직접 접근'하는 것이 좋다.
//  - 인스턴스 변수의 소유권이 부모인 경우
//   : 반드시 setter를 이용해야 한다.
//  - getter가 '지연 초기화'를 구현하고 있다면, 내부에서도 'getter'를 사용해야 한다.

// 2. 인스턴스 변수가 없어도, 메소드의 이름 규칙이 setter, getter의 이름규칙을 정확히 따른다면,
//    닷 연산자를 이용할 수 있다.
//    => Swift 에서는 프로퍼티를 만들 때, 필드가 없는 프로퍼티도 만들 수 있습니다.

@interface Phone : NSObject
@end

@implementation Phone
- (void)dealloc {
  printf("Phone 객체 파괴...\n");
}
@end

@implementation Person
- (void)foo {
  // printf("%p\n", _phone);
  
  // 지연 초기화 변수에 접근할 때는 내부에서도 getter를 이용해야 합니다.
  printf("%p\n", self.phone);
}

// 지연 초기화: 처음 접근하는 시점에 생성하는 것
- (Phone*)phone {
  if (_phone == nil)
    _phone = [Phone new];
  return _phone;
}

- (NSString*)fullName {
  return [NSString stringWithFormat:@"%@, %@", _firstName, _lastName];
}

- (void)setFullName:(NSString *)fullName {
  NSArray* arr = [fullName componentsSeparatedByString:@", "];
  self.firstName = arr[0];
  self.lastName = arr[1];
}

- (id)initWithPhone:(Phone *)phone {
  self = [super init];
  
  if (self) {
    _phone = phone;
  }
  
  return self;
}

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
  self = [super init];
  
  if (self) {
    // 2. 직접 접근
    _firstName = firstName;
    _lastName = lastName;
  }
  
  return self;
}

@end



int main() {
  // Phone* phone = [Phone new];
  // Person* person = [[Person alloc] initWithPhone:phone];
  // phone = nil;

  // printf("Main end...\n");
  
  Person* person = [[Person alloc] initWithFirstName:@"Gildong" lastName:@"Hong"];
  NSLog(@"%@", person.fullName);
  [person foo];
  
  person.fullName = @"Soonsin, Lee";
  NSLog(@"%@", person.fullName);
  NSLog(@"%@, %@", person.firstName, person.lastName);
}







// 프로퍼티에서 동기화 정책도 지원하고 있습니다.
// => 멀티 스레드에서 안전하게 값을 쓰거나 읽을 수 있는 기능을 제공하고 있습니다.

// atomic: getter / setter가 스레드 안전하게 동작한다. - 기본!
// nonatomic: 동기화 X

/*
@interface Person : NSObject

@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) int age;

@end

@implementation Person

@end
*/
