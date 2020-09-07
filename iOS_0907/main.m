// 메소드
#import <Foundation/Foundation.h>

@interface Car : NSObject

- (void)go;
- (void)go:(int)a;

- (void)go:(int)a speed:(int)speed;
- (void)go:(int)a speed:(int)speed color:(int)color;

@end

@implementation Car
- (void)go:(int)a speed:(int)speed {
  printf("go2: %d %d\n", a, speed);
}

- (void)go:(int)a speed:(int)speed color:(int)color {
  printf("go3: %d %d %d\n", a, speed, color);
}

- (void)go:(int)a {
  printf("go1: %d\n", a);
}

- (void)go {
  printf("go0\n");
}

@end

int main() {
  Car* car = [[Car alloc] init];  // [Car new];
  
  [car go];
  [car go:100];
  [car go:100 speed:120];
  [car go:100 speed:120 color:42];
  
  // [car go:100 speed:120 color:42 name:@"Truck"];
}
