import UIKit

class TableController3: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)

    // Configure the cell...
    cell.detailTextLabel?.text = "\(indexPath)"
    cell.imageView?.image = UIImage(named: "logo")

    return cell
  }
}
