// 셀렉터(Selector)
//  : 함수 포인터 / 메소드 참조

#import <Foundation/Foundation.h>

@interface Car : NSObject

- (void)go;
- (void)go:(int)a;
- (void)go:(int)a speed:(int)speed;

@end

@implementation Car

- (void)go {
  printf("go\n");
}
- (void)go:(int)a {
  printf("go1\n");
}
- (void)go:(int)a speed:(int)speed {
  printf("go2\n");
}

@end

int main() {
  
}

