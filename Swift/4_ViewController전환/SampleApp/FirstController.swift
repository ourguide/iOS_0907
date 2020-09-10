
import UIKit

struct User {
  let name: String
  let age: Int
}

class FirstController: UIViewController {
  // IB를 통해 만든 객체의 초기화 시점은 객체 생성 시점이 아닙니다.
  // - viewDidLoad가 호출될 때부터 가능하다.
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var ageLabel: UILabel!
  
  var user: User?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("viewDidLoad")
    if let user = user {
      nameLabel.text = user.name
      ageLabel.text = "\(user.age)"
    }
    
    // Do any additional setup after loading the view.
  }

  @IBAction func close(_ sender: Any) {
    dismiss(animated: true)
  }
}
