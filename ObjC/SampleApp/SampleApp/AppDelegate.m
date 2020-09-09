
#import "AppDelegate.h"

@implementation AppDelegate

// iOS App
//   UIWindow
//      - UIView
//   iOS 13 이전에는 모든 앱은 하나의 Window를 가집니다.


// - iOS 13 이후에는 모든 앱은 여러개의 Window를 가질 수 있습니다.
//   => Scene

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  printf("App이 시작되었음\n");
  
  // 1. 화면 해상도를 얻어온다.
  UIScreen* screen = [UIScreen mainScreen];
  CGRect rect = [screen bounds];
  
  // 2. window 생성
  self.window = [[UIWindow alloc] initWithFrame:rect];
  _window.backgroundColor = UIColor.whiteColor;
 
  UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 250, 48)];
  button.backgroundColor = UIColor.greenColor;
  
  [_window addSubview:button];
  
  UISlider* slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 350, 250, 48)];
  [_window addSubview:slider];
  
  // 이 코드가 없으면, 예외가 발생합니다.
  _window.rootViewController = [UIViewController new];
  
  // 3. window 등록하고 표시
  [_window makeKeyAndVisible];
  
  return YES;
}


/*
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  printf("App이 시작되었음\n");
  
  // 1. 화면 해상도를 얻어온다.
  UIScreen* screen = [UIScreen mainScreen];
  CGRect rect = [screen bounds];
  
  // 2. window 생성
  self.window = [[UIWindow alloc] initWithFrame:rect];
  _window.backgroundColor = UIColor.whiteColor;
  
  // 이 코드가 없으면, 예외가 발생합니다.
  _window.rootViewController = [UIViewController new];
  
  // 3. window 등록하고 표시
  [_window makeKeyAndVisible];
  
  return YES;
}
*/

- (void)applicationWillTerminate:(UIApplication *)application {
  printf("App이 종료될 예정임\n");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  printf("활성 상태가 되었음..\n");
}

- (void)applicationWillResignActive:(UIApplication *)application {
  printf("비활성 상태가 되었음..\n");
}

@end
