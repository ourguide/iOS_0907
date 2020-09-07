
#import <Foundation/Foundation.h>

// Ownership(소유권)
//   있다: Person객체가 Phone객체를 참조하는 동안은 dealloc이 호출되지 않는다.
//   없다: Person객체가 Phone객체를 참조하는 동안 dealloc의 가능성이 있다.

@class Phone;
@interface Person : NSObject {
  Phone* _phone;
}

- (void)setPhone:(Phone*)phone;

@end

@interface Phone : NSObject
@end

@implementation Person

- (void)dealloc {
  // 자신이 소유한 객체의 참조 계수를 감소해야 한다.
  [_phone release];
  
  [super dealloc];
}

// 소유권이 있다.
- (void)setPhone:(Phone*)phone {
  
  if (_phone != phone) {
    // 1. 기존 객체의 참조 계수를 감소해야 한다.
    [_phone release];
    // 2. 새로운 객체를 대입한다.
    _phone = phone;
    // 3. 새로운 객체의 참조 계수를 증가한다.
    [_phone retain];
  }
}

// 소유권이 없다.
#if 0
- (void)setPhone:(Phone*)phone {
  _phone = phone;
}
#endif

@end

@implementation Phone
@end

int main() {
  Person* person = [Person new];
  Phone* phone = [Phone new];  // 1
  
  person.phone = phone; // [person setPhone:phone]
  [phone release]; // Phone의 dealloc이 호출된다.
  
  // person이 phone을 이용한다.
  printf("person이 phone을 이용한다.\n"); // - Crash
  
  [person release];
}
