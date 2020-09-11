import UIKit

// Soft Keyboard에 의해서 TextField가 가려질 경우
// 처리하는 방법
//  => NotificationCenter
class ViewController: UIViewController {
  @IBOutlet var emailField: UITextField!
  @IBOutlet var passwordField: UITextField!
  
  @IBOutlet var bottomConstraint: NSLayoutConstraint!
  
  // 비동기(Async)
  //  => 결과를 처리하기 위해서 '콜백'을 등록한다.
  //  => 비동기 루틴이 어떤 컨텍스트에서 수행되는지 설정할 수 있다.
  //   - UI에 대한 처리 반드시 main 스레드에서 수행이 되어야 합니다.
  //   - 그 외 작업은 다른 스레드에서 처리하는 것이 가능합니다.
  //    : DispatchQueue
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let notificationCenter = NotificationCenter.default
    
    notificationCenter.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                   object: nil,
                                   queue: .main) { notification in
                                    
      let keyboardHeight = self.softKeyboardHeight(notification)
      
      UIView.animate(withDuration: 1, animations: {
        self.bottomConstraint.constant = 32 + keyboardHeight
        self.view.layoutIfNeeded()
      })
    }
    
    notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                   object: nil,
                                   queue: .main) { _ in
      UIView.animate(withDuration: 1, animations: {
        self.bottomConstraint.constant = 32
        self.view.layoutIfNeeded()
      })
    }
    
    notificationCenter.addObserver(forName: UIDevice.batteryLevelDidChangeNotification, object: nil, queue: .main) { notification in
      print("batteryLevelDidChangeNotification: \(notification)")
    }
    notificationCenter.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: .main) { notification in
      print("batteryStateDidChangeNotification: \(notification)")
    }
    
    /*
     notificationCenter.addObserver(self,
                                    selector: #selector(keyboardWillShow),
                                    name: UIResponder.keyboardWillShowNotification,
                                    object: nil)
     notificationCenter.addObserver(self,
                                    selector: #selector(keyboardWillHide),
                                    name: UIResponder.keyboardWillHideNotification,
                                    object: nil)
     */
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
