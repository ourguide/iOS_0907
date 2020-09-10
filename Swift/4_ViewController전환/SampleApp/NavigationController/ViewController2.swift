import UIKit

class ViewController2: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func touchesEnded(_ touches: Set<UITouch>,
                             with event: UIEvent?)
  {
    let controller = ViewController3()
    navigationController?.pushViewController(controller,
                                             animated: true)
  }
}
