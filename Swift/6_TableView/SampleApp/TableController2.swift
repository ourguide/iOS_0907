import UIKit

class TableController2: UIViewController {
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

extension TableController2: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int
  {
    return 42
  }

  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    if indexPath.row % 2 == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell2", for: indexPath) as! MyCell2
      cell.nameLabel.text = "\(indexPath)"
      cell.profileImageView.image = UIImage(named: "logo")
      return cell
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    cell.detailTextLabel?.text = "\(indexPath)"
    return cell
  }

  /*
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
      cell.detailTextLabel?.text = "\(indexPath)"
      return cell
    }
   */
}
