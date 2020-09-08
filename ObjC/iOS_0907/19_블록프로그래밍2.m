#import <Foundation/Foundation.h>

// Block + ObjC

// void f(int a, int b)
//    C: void (^block)(int, int)
// ObjC: (void(^)(int, int))block

@interface Car : NSObject
- (void)go:(int)a block:(void(^)(int a, int b))block;
@end

@implementation Car
- (void)go:(int)a block:(void(^)(int a, int b))block {
  printf("go: %d\n", a);
  block(10, 20);
}
@end

int main() {
  Car* car = [Car new];
  
  [car go:100
    block:^(int a, int b) {
    printf("on block: %d, %d\n", a, b);
  }];

//  [car go:100 block:^(int a, int b) {
//    printf("on block: %d, %d\n", a, b);
//  }];

}
