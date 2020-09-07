// 프로퍼티(Property)

#import <Foundation/Foundation.h>

@interface Car : NSObject {
  int _color;
}

// Getter
- (int)color;
// Setter
- (void)setColor:(int)color;

@end

@implementation Car

- (int)color {
  printf("Getter\n");
  return _color;
}

- (void)setColor:(int)color {
  printf("Setter\n");
  _color = color;
}

@end

int main() {
  Car* car = [[Car alloc] init];
  
  [car setColor:100];
  
  printf("%d\n", [car color]);
}
