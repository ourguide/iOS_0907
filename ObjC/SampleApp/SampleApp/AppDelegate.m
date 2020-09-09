
#import "AppDelegate.h"
#import "FirstController.h"
#import "ViewController.h"

@implementation AppDelegate

// iOS App
//   UIWindow
//      - UIView
//   iOS 13 이전에는 모든 앱은 하나의 Window를 가집니다.


// - iOS 13 이후에는 모든 앱은 여러개의 Window를 가질 수 있습니다.
//   => Scene


// iOS 에서는 View에서 발생하는 모든 이벤트는 ViewController를 통해 처리되어야 한다.

// UIApplication
//    - AppDelegate
//       - UIWindow
//            - UIViewController(rootViewController)
//               - UIView


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
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
  
  // _window.rootViewController = [[ViewController alloc] init];
  
  // - xib 파일명이 동일한 경우
  // _window.rootViewController = [[FirstController alloc] init];
  
  // - xib 파일명이 동일하지 않은 경우
  _window.rootViewController = [[FirstController alloc]
                                initWithNibName:@"MyView" bundle:nil];
  
  
  // 3. window 등록하고 표시
  [_window makeKeyAndVisible];
  
  return YES;
}
*/


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
  
  _window.rootViewController = [[FirstController alloc] init];
  
  // 3. window 등록하고 표시
  [_window makeKeyAndVisible];
  
  return YES;
}
*/


/*
// Interface Builder - GUI 제작 도구
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
 
  // - MyView.xib -> MyView.nib
  // MyView.xib를 로드해서, UIView로 변경하고, window에 등록한다.
  // Hello.app(Bundle)
  NSBundle* bundle = [NSBundle mainBundle];
  NSArray* arr = [bundle loadNibNamed:@"MyView" owner:nil options:nil];
  UIView* view = arr[0];
  
  [_window addSubview:view];
  
  // 이 코드가 없으면, 예외가 발생합니다.
  _window.rootViewController = [UIViewController new];
  
  // 3. window 등록하고 표시
  [_window makeKeyAndVisible];
  
  return YES;
}
*/

/*
// Window에 코드를 통해 View를 추가하는 방법
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
*/


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
