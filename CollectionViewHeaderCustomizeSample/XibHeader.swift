import UIKit

final class XibHeader: UICollectionReusableView {

    @IBOutlet weak var sectionLabel: UILabel!

    static let identifier: String = "XibHeader"

    static func nib() -> UINib {
        return UINib(nibName: XibHeader.identifier, bundle: nil)
    }
}
