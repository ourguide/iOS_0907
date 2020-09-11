import UIKit

// Soft Keyboard에 의해서 TextField가 가려질 경우
// 처리하는 방법
//  => NotificationCenter
class ViewController: UIViewController {
  @IBOutlet var emailField: UITextField!
  @IBOutlet var passwordField: UITextField!
  
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
  }
  
  @objc func keyboardWillHide() {
    print("keyboardWillHide")
  }
  
  override func touchesEnded(_ touches: Set<UITouch>,
                             with event: UIEvent?)
  {
    view.endEditing(true)
  }
}
