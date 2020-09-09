
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

// 1. iOS도 시작도 main 입니다.
// 2. UIApplicationMain
//    1) info.plist 로부터 앱의 기본 설정을 읽어들여서 설정합니다.
//    2) UIApplication 객체 생성
//    3) 앱의 상태에 변화에 대응하기 위한 사용자 정의 객체를 생성한다.
//         - 사용자로부터 전달받는 클래스의 이름을 통해 Class 객체 생성(NSClassForName)
//         - Class객체를 이용해서 사용자 정의 객체를 생성한다.
//         - UIApplication 객체의 delegate로 AppDelegate를 등록합니다.

//int main(int argc, char * argv[]) {
//  printf("Hello, iOS\n");
//
//  // main에서 auto release pool을 하나 생성해야 합니다.
//  @autoreleasepool {
//    return UIApplicationMain(argc, argv, nil, @"AppDelegate");
//  }
//}
