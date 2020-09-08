// 메소드
#import <Foundation/Foundation.h>

//----
class Car {
public:
  void go();
  void go(int a);
  void go(int a, int speed);
  void go(int a, int speed, int color);
  // C++ -> Name Mangling
}
//----

@interface Car : NSObject

// go
- (void)go;

// go:
- (void)go:(int)a;

// go:speed:
- (void)go:(int)a speed:(int)speed;

// go:speed:color:
- (void)go:(int)a speed:(int)speed color:(int)color;

// go:speed:color:name:
- (void)go:(int)a speed:(int)speed color:(int)color name:(NSString*)name;

@end

@implementation Car

- (void)go:(int)a speed:(int)speed color:(int)color name:(NSString*)name {
  // printf("go4: %d %d %d %s\n", a, speed, color, name);
  // NSLog(@"go4: %d %d %d %@\n", a, speed, color, name);
  
  printf("go4: %d %d %d %s\n", a, speed, color, [name cStringUsingEncoding:NSASCIIStringEncoding]);
  printf("go4: %d %d %d %s\n", a, speed, color, [name UTF8String]);
}


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
  
  // car.go(100, 120, 42, "Truck");
  [car go:100
    speed:120
    color:42
     name:@"Truck"];
}
