#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// Storyboard 사용하지 않는 경우
//     Main storyboard file base name   |  빈칸

@property(nonatomic, strong) UIWindow* window;


// Storyboard 사용하는 경우는 위의 모든 코드가 프레임워크 내부에서 처리되도록 변경되었습니다.
//  Info.plist
//     Main storyboard file base name   |  Main


@end

