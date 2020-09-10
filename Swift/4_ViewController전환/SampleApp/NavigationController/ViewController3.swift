import UIKit

class ViewController3: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }
  
  override func touchesEnded(_ touches: Set<UITouch>,
                             with event: UIEvent?)
  {
    // navigationController?.popViewController(animated: true)
    // navigationController?.popToRootViewController(animated: true)
    dismiss(animated: true)
  }
}
