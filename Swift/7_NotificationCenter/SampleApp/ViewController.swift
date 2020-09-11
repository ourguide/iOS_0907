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
  
  @objc func keyboardWillShow(_ notification: Notification) {
    print("keyboardWillShow")
    let keyboardHeight = softKeyboardHeight(notification)
    bottomConstraint.constant = 32 + keyboardHeight
  }
  
  @objc func keyboardWillHide(_ notification: Notification) {
    print("keyboardWillHide")
    bottomConstraint.constant = 32
  }
  
  // 키보드의 frame 정보를 알아내기 위해서는, notification의 정보가 필요합니다.
  func softKeyboardHeight(_ notification: Notification) -> CGFloat {
    if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      return frame.cgRectValue.height
    }
    
    return 0
  }
  
  
  
  override func touchesEnded(_ touches: Set<UITouch>,
                             with event: UIEvent?)
  {
    view.endEditing(true)
  }
}
