#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _childView.frame = self.view.frame;
}

- (IBAction)open:(id)sender {
  _childView.frame = CGRectMake(0, 0, 0, 0);
  _childView.transform = CGAffineTransformMakeRotation(3.14);
  // 180도 회전

  [self.view addSubview:_childView];
  
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:1];
  
  _childView.frame = self.view.frame;
  _childView.transform = CGAffineTransformMakeRotation(0);
  
  [UIView commitAnimations];
}

@end
