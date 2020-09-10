import UIKit

class MyCell: UITableViewCell {
  @IBOutlet var profileImageView: UIImageView!

  @IBOutlet var nameLabel: UILabel!

  @IBOutlet var phoneLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
}
