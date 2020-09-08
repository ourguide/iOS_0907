#import <Foundation/Foundation.h>

@interface Car : NSObject
- (void)go;
@end

@interface User: NSObject
- (void)go;
@end

@implementation Car
- (void)go {
  printf("Car go\n");
}
@end

@implementation User
- (void)go {
  printf("User go\n");
}
@end

// Command + ,: 설정
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
int main() {
  SEL s = @selector(go);
  id p = [Car new];
  
  [p performSelector:s];
  
  Car* obj = [Car new];
  
  //--------원리를 보기 위한 코드입니다 --------//
  // ObjC의 모든 메소드는 C언어 함수로 번역이 되어 있습니다.
  // - 아래 코드처럼 C의 함수 포인터를 통해 메소드를 호출하는 것이 가능합니다.
  typedef void (*FP)(id, SEL, ...);
  FP f = (FP)[obj methodForSelector:@selector(go)];  // 실제 구현의 주소를 얻어온다.
  
  f(obj, @selector(go));
}
