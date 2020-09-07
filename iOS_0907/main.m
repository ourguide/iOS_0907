
#import <Foundation/Foundation.h>

@class Phone;
@interface Person : NSObject

// ARC - 프로퍼티 소유권

@end

@interface Phone : NSObject
@end

@implementation Person
@end

@implementation Phone
@end

int main() {
  Person* person = [Person new];
  Phone* phone = [Phone new];
  
  // person.phone = phone;
  // [phone release];
  
  printf("Release 되었음..\n");
  // [person release];
}
