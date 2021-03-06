import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // AppDelegate
  //   - UIWindow
  //      - ViewController : rootViewController
  //                 | present
  //                 | dismiss
  //         - UINavtationController
  //             - ViewController1 - rootViewController
  //                     | pushViewController
  //                     | popViewController
  //                     | popToRootViewController
  //             - ViewController2
  //             - ViewController3
  
  @IBAction func navi1(_ sender: Any) {
    // UINavigationController 기반으로 ViewController를 관리하고 싶다.
    let rootController = ViewController1()
    let naviController = UINavigationController(rootViewController: rootController)
    naviController.modalPresentationStyle = .fullScreen
    
    present(naviController, animated: true)
  }
  

  @IBAction func navi2(_ sender: Any) {
  }
  
  //---------------------------------------
  
  // XIB 기반
  // 1. Cocoa Touch class 생성 - XIB 파일 포함
  // 2. FirstController 객체 생성
  // 3. 전환
  //     - present(controller, animated: true)
  //     - dismiss(controller)
  //       : 자식이 호출하였을 때 - 자신이 내려간다.
  //         부모가 호출하였을 때 - 자신의 위에 있는 ViewController가 제거된다.
  @IBAction func open1(_ sender: Any) {
    let controller = FirstController()
    
    // iOS 13 이후로, ViewController를 fullscreen으로 설정하기 위해서는 아래와 같은 코드가 필요합니다.
    controller.modalPresentationStyle = .fullScreen
    controller.user = User(name: "Tom", age: 42)
    // controller.nameLabel.text = "Tom"
    // controller.ageLabel.text = "42"
    
    // closure 안에서 메소드 또는 프로퍼티에 접근할 때는,
    // self를 명시적으로 사용해야 합니다.
    present(controller, animated: true) {
      print("present callback")
      // controller.nameLabel.text = "Tom"
      // controller.ageLabel.text = "42"
    }
  }
  
  // Storyboard 전환
  // 1. Storyboard에서 ViewController 추가
  // 2. Cocoa Touch class 생성 - XIB 포함 X
  // 3. Storyboard에서 생성된 ViewController의 Custom Class로 생성된 클래스를 연결해주어야 합니다.
  // 4. 전환
  //     - Button -> ViewController 연결
  //     - performSegue(withIdentifier: "MySegue", sender: nil)
  
  //     unwindSegue를 정의해서, Button을 exit와 연결
  @IBAction func open2(_ sender: Any) {
    performSegue(withIdentifier: "MySegue", sender: nil)
  }
  
  // Storyboard는 controller를 프레임워크 생성합니다.
  // 데이터를 전달하기 위해서는 아래 메소드의 재정의가 필요합니다.
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("prepare - \(segue)")
    if segue.identifier == "MySegue" {
      if let controller = segue.destination as? SecondController {
        controller.user = User(name: "Bob", age: 30)
      }
    }
  }
  
  @IBAction func open3(_ sender: Any) {
    let controller = SecondController.create()
    controller.user = User(name: "Bob", age: 42)
    
    present(controller, animated: true)
  }
  
  @IBAction func unwind(segue: UIStoryboardSegue) {}
}

// ViewController 전환
// => UIViewController의 역활은 View의 이벤트를 처리하고, View를 설정하는 작업을 수행합니다.

// 1. XIB 기반
// 2. Storyboard 기반
// 3. Storyboard 기반 - XIB 스타일

