import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
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
    
    // closure 안에서 메소드 또는 프로퍼티에 접근할 때는,
    // self를 명시적으로 사용해야 합니다.
    present(controller, animated: true) {
      // self.dismiss(animated: true)
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
  
  @IBAction func open3(_ sender: Any) {
  }
  
  @IBAction func unwind(segue: UIStoryboardSegue) {
    
  }
  
}





// ViewController 전환
// => UIViewController의 역활은 View의 이벤트를 처리하고, View를 설정하는 작업을 수행합니다.

// 1. XIB 기반
// 2. Storyboard 기반
// 3. Storyboard 기반 - XIB 스타일

