
#import <Foundation/Foundation.h>

// 1. 프로퍼티를 통해서 setter를 생성할 수 있습니다.
@class Phone;
@interface Person : NSObject

// MRC
@property(retain) Phone* phone;

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
  
  person.phone = phone;
  [phone release];
  
  printf("Release 되었음..\n");
  [person release];
}
