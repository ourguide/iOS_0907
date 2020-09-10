
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
  }
}

// UIPickerView
//  component
//  row

// UITableView
//  section
//  row

// Protocol을 구현할 때, extension을 이용하면 영역 구분이 편리합니다.
extension TableController1: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
      return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
    cell.textLabel?.text = "\(indexPath)"
    
    return cell
  }
}
