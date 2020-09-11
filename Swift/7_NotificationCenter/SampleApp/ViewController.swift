import UIKit

// Soft Keyboard에 의해서 TextField가 가려질 경우
// 처리하는 방법
//  => NotificationCenter
class ViewController: UIViewController {
  @IBOutlet var emailField: UITextField!
  @IBOutlet var passwordField: UITextField!
  
  @IBOutlet var bottomConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(self,
                                   selector: #selector(keyboardWillShow),
                                   name: UIResponder.keyboardWillShowNotification,
                                   object: nil)
    notificationCenter.addObserver(self,
                                   selector: #selector(keyboardWillHide),
                                   name: UIResponder.keyboardWillHideNotification,
                                   object: nil)
  }
  
  @objc func keyboardWillShow() {
    print("keyboardWillShow")
    
    bottomConstraint.constant = 320
    // view.frame = CGRect(x: 0, y: -200, width: 375, height: 667)
  }
  
  @objc func keyboardWillHide() {
    print("keyboardWillHide")
    bottomConstraint.constant = 120
    // view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>,
                             with event: UIEvent?)
  {
    view.endEditing(true)
  }
}
