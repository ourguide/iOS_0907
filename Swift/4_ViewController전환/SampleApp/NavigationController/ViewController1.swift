import UIKit

class ViewController1: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func touchesEnded(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    let controller = ViewController2()
    
    // navigation controller안에 포함된 모든 view controller는
    //  - navigationController 프로퍼티가 유효합니다.
    
    navigationController?.pushViewController(controller,
                                             animated: true)
  }
}
