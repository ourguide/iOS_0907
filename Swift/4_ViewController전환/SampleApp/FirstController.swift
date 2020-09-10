
import UIKit

// 접근 지정 레벨(class, struct, enum, func)
// public - 다른 모듈에서 접근 가능하다.
// internal - 같은 모듈에서 접근 가능하다. - default
// private - 같은 파일에서 접근 가능하다.

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
