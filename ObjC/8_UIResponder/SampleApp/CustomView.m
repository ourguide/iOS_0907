
#import "CustomView.h"

// UIView를 재정의한다.
//  => 1. 초기화 메소드의 재정의가 필요합니다.
//      1) initWithFrame: 코드를 통해 생성하는 View
//      2) initWithCoder: IB(XIB, Stroryboard)를 통해 생성하는 View

// @property(nonatomic, strong) UIView* contentView;

@implementation CustomView

- (void)commonInit {
  // XIB로부터 View를 생성한다.
  NSBundle* bundle = [NSBundle bundleForClass:[CustomView class]];
  UINib* nib = [UINib nibWithNibName:@"CustomView" bundle:bundle];
  UIView* view = [nib instantiateWithOwner:self options:nil][0];
  view.frame = self.bounds;

  _contentView = view;
  [self addSubview:view];
}

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self commonInit];
  }
  NSLog(@"initWithFrame");
  return self;
}

// 객체를 파일 또는 네트워크를 통해 전송할 경우, 직렬화를 해야 한다. -> NSCoder
- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    [self commonInit];
  }
  NSLog(@"initWithCoder");
  return self;
}


@end
