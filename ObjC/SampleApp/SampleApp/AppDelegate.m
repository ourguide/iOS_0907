
#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  
  printf("App이 시작되었음\n");
  
  return YES;
}

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
