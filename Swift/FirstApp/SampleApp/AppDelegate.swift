import UIKit

// @UIApplicationMain
// 1. Info.plist 설정을 로드하고, 적절하게 UIApplication 객체 생성
// 2. 사용자가 정의한 AppDelegate를 생성하고, UIApplication객체의 delegate로 설정한다.
//    AppDelegate
//         UIWindow
//             UIViewController
//                 UIView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
//    let bounds = UIScreen.main.bounds
//    
//    window = UIWindow(frame: bounds)
//    window?.backgroundColor = UIColor.white
//    
//    window?.rootViewController = ViewController()
//    
//    window?.makeKeyAndVisible()
    return true
  }
}
