
import UIKit

// UITableView
//  - UITableViewDataSource
//  - UITableViewDelegate

class TableController1: UIViewController {
  @IBOutlet var tableView: UITableView! {
    didSet {
      tableView.dataSource = self
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    // tableView가 사용할, Custom cell의 nib를 등록한다.
    tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    
    //                                 Swift
    // [UITableViewCell class] -> UITableViewCell.self
    
    // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
  }
}

// UIPickerView
//  component
//  row

// UITableView
//  section
//  row

extension TableController1: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 32
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MyCell")
     
    //    if (cell == nil) {
    //      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
    //    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
     
    cell.nameLabel.text = "\(indexPath)"
    cell.profileImageView.image = UIImage(named: "logo")
     
    return cell
  }
  
  // 핵심
  // 1. Cell을 매번 새롭게 생성하는것이 아니라, 재활용해야 한다.
  // 2. 재활용 된 Cell의 내용을 변경해야 한다.
  // 3. 재활용 가능한 Cell이 없을 경우, 생성해야 한다.
  /*
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     // var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MyCell")
    
     //    if (cell == nil) {
     //      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
     //    }
     let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    
     cell.textLabel?.text = "\(indexPath)"
     cell.imageView?.image = UIImage(named: "logo")
    
     return cell
   }
   */
}

/*
 // Protocol을 구현할 때, extension을 이용하면 영역 구분이 편리합니다.
 extension TableController1: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
     return 1
   }
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 30
   }
  
   // iOS Device
   //  SE2: 667 x 375(개발)
   //       1334 x 750(레티나 디스플레이)
  
   // 32x32 - logo.png
   // 64x64 - logo@2x.png
   // 96x96 - logo@3x.png

 #if false
   // 데이터의 수 만큼 뷰를 생성하는 것이 아니라, 화면에 필요한만큼만 뷰를 생성하고, 재활용해야 한다.
   //  Android - view holder pattern
   //          -> RecyclerView
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     // 1. UITableView에서 활용 가능한 View가 있는지 요청한다.
     var cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
    
     // 2. 재활용 가능한 view가 없으면, nil을 반환한다.
     if cell == nil {
       cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
       print("Cell이 새로 생성되었다.")
     } else {
       print("Cell이 재활용되었다.")
     }
    
     cell?.textLabel?.text = "\(indexPath)"
     cell?.detailTextLabel?.text = "Detail text label...."
     cell?.accessoryType = .disclosureIndicator
     // cell?.imageView?.image = UIImage(named: "logo.png")
    
     // Assets.xcassets
     cell?.imageView?.image = UIImage(named: "logo")
    
     return cell!
   }
 #endif
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     // 1. UITableView에서 활용 가능한 View가 있는지 요청한다.
     let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    
     cell.textLabel?.text = "\(indexPath)"
     cell.detailTextLabel?.text = "Detail text label...."
     cell.accessoryType = .disclosureIndicator
     cell.imageView?.image = UIImage(named: "logo")
    
     return cell
   }
  
   /*
     // 1. CustomCell을 xib 기반으로 생성한다.
     // 2. 생성된 Cell의 xib에서 reuseIdentifier를 반드시 정의해야 한다.
     // 3. Bundle을 통해 Cell을 생성해야 한다.
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       var cell: MyCell? = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell
       if (cell == nil) {
         // cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
         // - XIB로부터 MyCell을 생성해야 합니다.
         cell = Bundle.main.loadNibNamed("MyCell", owner: nil, options: nil)?[0] as? MyCell
         //     [Any]?[0] -> Any -> as? MyCell -> MyCell?
         // cell?.reuseIdentifier = "MyCell"
         print("Cell이 새로 생성되었다.")
       } else {
         print("Cell이 재활용되었다.")
       }
    
       cell?.nameLabel.text = "\(indexPath)"
       cell?.profileImageView?.image = UIImage(named: "logo")
  
       return cell!
     }
    */
  
   /*
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let reuseIdentifier = "MyCell"
    
     // tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
     //  : 미리 tableview에 nib 또는 Class를 등록해두면, 객체를 자동으로 생성해서 재활용해준다.
     //  - tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
     let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyCell
    
     cell.nameLabel.text = "\(indexPath)"
     cell.profileImageView?.image = UIImage(named: "logo")
    
     return cell
   }
  */
  
 }
 
  */
