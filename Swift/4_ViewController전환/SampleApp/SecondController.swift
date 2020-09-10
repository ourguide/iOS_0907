
import UIKit

class SecondController: UIViewController {
  var user: User?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    if let user = user {
      print(user)
    }
  }
  
  // Storyboard에서 SecondViewController를 찾아서,
  // 직접 생성한다.
  static func create() -> SecondController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
    return controller
  }

}
