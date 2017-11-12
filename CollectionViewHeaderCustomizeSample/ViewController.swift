import UIKit

final class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fl = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        fl.sectionHeadersPinToVisibleBounds = true
        //fl.headerReferenceSize = CGSize(width: self.view.bounds.width, height: 30)
        collectionView?.register(XibHeader.nib(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: XibHeader.identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: datasorce, delegate

extension ViewController {

    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionElementKindSectionHeader {
            if indexPath.section == 0 || indexPath.section == 4 {
                guard let xibHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: XibHeader.identifier, for: indexPath) as? XibHeader else {
                    fatalError("Could not find proper header")
                }
                xibHeader.sectionLabel.text = "section \(indexPath.section)"
                return xibHeader
            } else {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader else {
                    fatalError("Could not find proper header")
                }
                header.sectionLabel.text = "section \(indexPath.section)"
                return header
            }
        }

        return UICollectionReusableView()
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize.zero
        } else {
            return CGSize(width: self.view.bounds.width, height: 30)
        }
    }

}
