
#import <Foundation/Foundation.h>

// 1. 프로퍼티를 통해서 setter를 생성할 수 있습니다.
@class Phone;
@interface Person : NSObject

// MRC
@property(retain) Phone* phone;
// Setter에서 참조 계수가 증가한다.

@end

@interface Phone : NSObject
- (void)dealloc;
@end

@implementation Person
- (void)dealloc {
  [_phone release];
  
  [super dealloc];
}

@end

@implementation Phone
- (void)dealloc {
  printf("Phone 객체 파괴\n");
  [super dealloc];
}
@end

int main() {
  Person* person = [Person new];
  Phone* phone = [Phone new];
  
  printf("Ref count: %ld\n", [phone retainCount]);
  person.phone = phone;
  printf("Ref count: %ld\n", [phone retainCount]);
  [phone release];
  
  printf("Release 되었음..\n");
  [person release];
}
