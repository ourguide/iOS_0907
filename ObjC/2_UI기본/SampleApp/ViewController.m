#import "ViewController.h"

@interface ViewController ()
@property(assign, nonatomic) int count;
@end


@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  self.count = 0;
  
  [_addButton addTarget:self action:@selector(touched) forControlEvents:UIControlEventTouchUpInside];
  
}

- (void)touched {
  self.count++;
  
  [_countLabel setText:[NSString stringWithFormat:@"%d", _count]];
}


@end
