
import UIKit

class SecondController: UIViewController {
  var user: User?
  
  // KVO를 view의 초기값을 설정하는 용도로 많이 사용합니다.
  @IBOutlet var nameLabel: UILabel! {
    didSet {
      if let name = user?.name {
        nameLabel.text = name
      }
    }
  }
  
  @IBOutlet var ageLabel: UILabel! {
    didSet {
      if let age = user?.age {
        ageLabel.text = "\(age)"
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }
  
  // Storyboard에서 SecondViewController를 찾아서,
  // 직접 생성한다.
  static func create() -> SecondController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
    return controller
  }
}
