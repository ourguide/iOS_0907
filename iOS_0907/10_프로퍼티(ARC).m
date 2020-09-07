
#import <Foundation/Foundation.h>

@class Phone;
@interface Person : NSObject

// ARC - 프로퍼티 소유권
// MRC
// retain      ->       strong(소유권이 있다)
// @property(strong) Phone* phone;

// assign      ->       weak(소유권이 없음)
@property(weak) Phone* phone;
// 1) Setter에서 참조 계수를 증가하지 않는다.
// 2) 참조하는 객체가 파괴되었을 경우, 참조변수의 값을 nil로 바꿔준다.
//   => autoniling
//             ->       assign(built-in type / scala type) - value type
//             ->       unsafe_unretained

// copy        ->       copy
//  : 복제본을 만든다.

@property(assign) int age;

// Reference type: NSString*, Person* : 참조 계수
// Value type: int, double, char, float: 값 타입 - 복사

- (void)foo;
@end

@interface Phone : NSObject {
  int _a;
}

- (void)call;

@end

@implementation Person

- (void)foo {
  printf("%p\n", _phone);
  [_phone call];
}

@end

@implementation Phone
- (void)call {
  printf("Phone call - %d\n", _a);
}

- (void)dealloc {
  printf("Phone 객체 파괴\n");
  // ARC에서는 [super dealloc]이 자동으로 처리됩니다.
}

@end

int main() {
  Person* person = [Person new];
  Phone* phone = [Phone new];
  
  person.phone = phone;
  // [phone release];
  phone = nil;
  printf("Release 되었음..\n");
  
  [person foo];
  
  // [person release];
}
