
#import "MyView.h"

@implementation MyView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"MyView - touchesBegan");
  
  // UIViewController에 이벤트를 전달한다.
  [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"MyView - touchesEnded");
  [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"MyView - touchesMoved");
  [super touchesMoved:touches withEvent:event];
}

@end
