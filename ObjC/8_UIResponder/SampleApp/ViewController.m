#import "ViewController.h"

// UIReponsder Chain(Chain of Responsibility)
//  - Touch 이벤트
//   UIView -> UIViewController -> UIWindow -> AppDelegate

//  => 반드시 Chain을 따르는 모든 것이 UIReponder의 자식이어야 한다.

@implementation ViewController

- (IBAction)buttonClick:(id)sender {
  NSLog(@"buttonClick");
}

- (IBAction)tap:(id)sender {
   NSLog(@"tap");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#if 0
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"touchesBegan");
  
  NSSet* t = event.allTouches;
  NSLog(@"%lu개의 터치가 발생", t.count);
  [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"touchesEnded");
  [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"touchesMoved");
  [super touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  NSLog(@"touchesCancelled");
}
#endif


@end
