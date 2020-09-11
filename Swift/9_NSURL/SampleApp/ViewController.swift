import UIKit

class ViewController: UIViewController {
  
  static let imageURL = "https://images.pexels.com/photos/956981/milky-way-starry-sky-night-sky-star-956981.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
  
  @IBOutlet var imageView: UIImageView!
  
  // 아래 코드는 동기식 코드 입니다.
  //  => 네트워크의 요청이 시간이 걸리면, 화면이 멈춥니다.
  //  => 화면이 멈추기 때문에, main 스레드 안에서 절대 네트워크 요청 등의 시간이 걸리는 작업을 수행하면 안됩니다.
  //  => 비동기 처리! -> callback(결과, 오류여부)
  //     - NSURLConnection: deprecated
  //     - NSURLSession
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
    guard let url = URL(string: ViewController.imageURL) else {
      return
    }
    
    let session = URLSession(configuration: .default)
    let task = session.downloadTask(with: url) { (location, response, error) in
      if error != nil {
        print(error?.localizedDescription ?? "Unknown error")
        return
      }
      
      guard let response = response as? HTTPURLResponse else {
        return
      }
      
      // HTTP Response
      //  200..<300 - 성공
      //  400..<500 - 오류(클라이언트)
      //  500..<600 - 오류(서버)
      print("\(response.statusCode)")
      guard 200..<300 ~= response.statusCode else {
        return
      }
      
      guard let location = location else {
        return
      }
      
      // 저장된 파일을 불러온다.
      guard let data = try? Data(contentsOf: location) else {
        return
      }
      
      guard let image = UIImage(data: data) else {
        return
      }
      
      // UIImageView.image must be used from main thread only
      // - 비동기 콜백은 다른 스레드 컨텍스트에서 수행됩니다.
      //  => UI를 업데이트 하기 위해서는 메인 스레드에서 수행되어야 합니다.
      DispatchQueue.main.async {
        self.imageView.image = image
      }
    }
    
    task.resume() // !!
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

