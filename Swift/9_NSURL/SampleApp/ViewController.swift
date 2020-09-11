import Alamofire // Alamofire 의존성 추가
import Kingfisher
import Moya
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
    let task = session.downloadTask(with: url) { location, response, error in
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
      guard 200 ..< 300 ~= response.statusCode else {
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
  
  // Objective C
  //  => AFNetworking
  // Swift
  //  => Alamofire
  //  => Kingfisher
  
  // iOS - 패키지(라이브러리 설치)
  // 1. Cocoapod - ObjC / Swift
  //  : 소스를 같이 빌드
  //  문제점: 빌드가 느리다.
  //   1) gem: sudo gem install cocoapods
  //   2) homebrew: brew install cocoapods
  
  //  1.
  //  $ pod init
  //   -> Podfile 생성
  //  2.
  //    Podfile에 의존성을 추가하면 됩니다.
  //  3.
  //  $ pod install
  //   -> Podfile.lock : 설치된 라이브러리의 버전을 고정한다.
  //     Pods - project : 설치된 라이브러리에 대한 프로젝트
  //     ProjectName.xcworkspace
  
  //  Workspace
  //    - Project
  //    - Pods
  
  // 2. Carthage - Swift
  //  : 빌드된 라이브러리 참조
  //  - 처음 설치할 때만, 느리고 이후에는 빠르게 동작한다.
  
  /*
   enum Result {
      case success(Data)
      case failure(AFError)
   }
   */
 
  //    3. Swift Package Manager - Swift
  
  // 3. Alamofire
  @IBAction func click3(_ sender: Any) {
    AF.request(ViewController.imageURL).responseData { response in
      // response.result : Result<Data, AFError>
      switch response.result {
      case let .success(data):
        guard let image = UIImage(data: data) else {
          return
        }
        self.imageView.image = image
        
      case let .failure(error):
        print(error.localizedDescription)
      }
    }
  }
  
  // 4. Kingfisher
  @IBAction func click4(_ sender: Any) {
    guard let url = URL(string: ViewController.imageURL) else {
      return
    }
    
    // > |
    let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
      |> RoundCornerImageProcessor(cornerRadius: 100)
    
    imageView.kf.setImage(with: url, options: [
      .processor(processor),
      .scaleFactor(UIScreen.main.scale),
      .cacheOriginalImage
    ])
  }
  
  // (Encodable)JSON <- User <- JSON(Decodable)
  struct User : Decodable {
    let login: String
    let id: Int
    let avatar_url: String
  }
  
  /*
   {
   "login": "ourguide",
   "id": 591413,
   "avatar_url": "https://avatars0.githubusercontent.com/u/591413?v=4",
   }
  */
  func handleResponse(response: Response) {
//    if let user = try? response.mapJSON() {
//      print(user)
//    }
    
    if let user = try? response.map(User.self) {
      print(user)
    }
  }
  
  // 5. Moya
  @IBAction func click5(_ sender: Any) {
    let provider = MoyaProvider<GithubAPI>()
    provider.request(.getUser(login: "ourguide")) { result in
      switch result {
      case let .success(response):
        self.handleResponse(response: response)
      case let .failure(error):
        print(error.localizedDescription)
      }
    }
    
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

// Android
//   API
//      Retrofit + OKHttp

// iOS
//   API
//      Moya + Alamofire
// ---------------------------

enum GithubAPI {
  // api.github.com/users/login
  case getUser(login: String)
  case search
}

// TargetType
extension GithubAPI: TargetType {
  var baseURL: URL {
    return URL(string: "https://api.github.com")!
  }
  
  var path: String {
    switch self {
    case let .getUser(login):
      return "/users/\(login)"
    case .search:
      return "/search/users"
    }
  }
  
  // get, post, put, delete
  var method: Moya.Method {
    switch self {
    case .getUser:
      return .get
    case .search:
      return .post
    }
  }
  
  // Test 목적
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .getUser:
      return .requestPlain
    case .search:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    switch self {
//    case .getUser:
//      return [ "Authorization": "Bearer xxxx" ]
    default:
      return ["Content-Type": "application/json"]
    }
  }
}
