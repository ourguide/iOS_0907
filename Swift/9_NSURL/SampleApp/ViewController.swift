import UIKit

class ViewController: UIViewController {
  
  static let imageURL = "https://ih0.redbubble.net/image.415946483.7473/flat,1000x1000,075,f.u1.jpg"
  
  @IBOutlet var imageView: UIImageView!
  
  @IBAction func click1(_ sender: Any) {
    guard let url = URL(string: ViewController.imageURL) else {
      print("url")
      return
    }
    
    guard let data = try? Data(contentsOf: url) else {
      print("data")
      return
    }
    
    guard let image = UIImage(data: data) else {
      print("image")
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

