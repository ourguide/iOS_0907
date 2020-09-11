import UIKit

class ViewController: UIViewController {
  
  static let imageURL = "https://www.logo.wine/a/logo/Swift_(programming_language)/Swift_(programming_language)-Logo.wine.svg"
  // https://www.logo.wine/a/logo/Swift_(programming_language)/Swift_(programming_language)-Logo.wine.svg
  
  @IBOutlet var imageView: UIImageView!
  
  @IBAction func click1(_ sender: Any) {
    guard let url = URL(string: ViewController.imageURL) else {
      return
    }
    
    guard let data = try? Data(contentsOf: url) else {
      return
    }
    
    guard let image = UIImage(data: data) else {
      return
    }
    
    imageView.image = image
  }
  
  
  @IBAction func click2(_ sender: Any) {
  }
  @IBAction func click3(_ sender: Any) {
  }
  @IBAction func click4(_ sender: Any) {
  }
  @IBAction func click5(_ sender: Any) {
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
}

