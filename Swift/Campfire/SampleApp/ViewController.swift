
import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    var images = [UIImage]()
    for i in 1...17 {
      let filename = String(format: "campFire%02d.gif", i)
      if let image = UIImage(named: filename) {
        images.append(image)
      }
    }
    
    imageView.animationImages = images
  }
  
  @IBAction func play(_ sender: Any) {
    imageView.startAnimating()
  }
  
  @IBAction func pause(_ sender: Any) {
    imageView.stopAnimating()
  }
  
  @IBAction func valueChanged(_ sender: UISlider) {
  }
}

