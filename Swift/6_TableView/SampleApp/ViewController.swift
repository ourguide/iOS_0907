import UIKit

// open: 다른 모듈에서 클래스에 대한 확장을 허용하는 문법

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // XIB
  @IBAction func tableView1(_ sender: Any) {
    let controller = TableController1()
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true)
  }
  
  // Storyboard
  @IBAction func tableView2(_ sender: Any) {
  }
  
}

