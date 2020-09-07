
#import <Foundation/Foundation.h>

@class Phone;
@interface Person : NSObject

@property(strong, nonatomic) NSString* firstName;
@property(strong, nonatomic) NSString* lastName;

@property(strong, nonatomic) Phone* phone;

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;
- (id)initWithPhone:(Phone*)phone;

@end

// => Effective Objective C
// 1. 객체 내부에서 인스턴스 변수에 접근할 때는 읽을 때는 직접 접근하고, 쓸때는 접근자 메소드를 이용하는 것이 좋습니다.
//  - 인스턴스 변수의 소유권이 자신일 경우 - !!
//   : 초기화 메소드 안에서 값을 설정할 때는 setter를 이용하는 것이 아니라, 직접 접근하는 것이 좋다.
//  - 인스턴스 변수의 소유권이 부모인 경우
//   : 반드시 setter를 이용해야 한다.

@implementation Person
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

@interface Phone : NSObject
@end

@implementation Phone
- (void)dealloc {
  printf("Phone 객체 파괴...\n");
}
@end


int main() {
  Phone* phone = [Phone new];
  Person* person = [[Person alloc] initWithPhone:phone];
  phone = nil;
  
  printf("Main end...\n");
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
