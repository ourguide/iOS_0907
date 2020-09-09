#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// #define IBOutlet

// Outlet - 참조
// Action - 동작에 함수를 정의(Target-Action)
@property (strong, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic) IBOutlet UIButton *addButton;

// UIView: view
//        - label(2)
//        - button(2)

// UIViewController
//     view
//        - countLabel(strong)
//        - addButton

@end
