// Design Pattern => GoF's Design Pattern
// iOS => Cocoa Design Pattern
//   1) Target-Action: 이벤트 핸들링

#import <Foundation/Foundation.h>

@interface Button : NSObject {
  id  _target;
  SEL _action;
}

- (void)click;
- (void)addTarget:(id)target action:(SEL)action;

@end

@interface Dialog : NSObject
- (void)close;
@end

// Button이 click 되었을 때, Dialog의 close가 호출되도록 만들고 싶다.

@implementation Button
- (void)addTarget:(id)target action:(SEL)action {
  _target = target;
  _action = action;
}

- (void)click {
  printf("Button clicked...\n");
  
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  [_target performSelector:_action];
  #pragma clang diagnostic pop
}
@end

@implementation Dialog
- (void)close {
  printf("Dialog closed...\n");
}
@end

int main() {
  Dialog* dialog = [Dialog new];
  Button* button = [Button new];
  
  [button addTarget:dialog
             action:@selector(close)];
  
  [button click];
}
