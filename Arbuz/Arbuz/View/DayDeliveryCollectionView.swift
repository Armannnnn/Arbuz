import UIKit

class DayDeliveryCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let cellIdentifier = "CollectionViewCell"
    let numberOfItems = 7
    var selectedIndexPaths: Set<IndexPath> = []

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        super.init(frame: frame, collectionViewLayout: layout)

        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionView() {
        dataSource = self
        delegate = self
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
        allowsMultipleSelection = true

        register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = selectedIndexPaths.contains(indexPath) ? UIColor(red: 0.922, green: 0.984, blue: 0.914, alpha: 1) : UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)

        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let weekdayLabel = UILabel(frame: cell.contentView.bounds)
        weekdayLabel.text = getWeekdayName(for: indexPath.row)
        weekdayLabel.textAlignment = .center
        weekdayLabel.textColor = selectedIndexPaths.contains(indexPath) ? UIColor(red: 0.325, green: 0.788, blue: 0.353, alpha: 1) : UIColor(red: 0.251, green: 0.267, blue: 0.314, alpha: 1)

        cell.contentView.addSubview(weekdayLabel)

        cell.layer.cornerRadius = 10

        return cell
    }

    // MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = UIColor(red: 0.922, green: 0.984, blue: 0.914, alpha: 1)

            if let label = cell.contentView.subviews.first as? UILabel {
                label.textColor = UIColor(red: 0.325, green: 0.788, blue: 0.353, alpha: 1)
            }

            selectedIndexPaths.insert(indexPath)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)

            if let label = cell.contentView.subviews.first as? UILabel {
                label.textColor = UIColor(red: 0.251, green: 0.267, blue: 0.314, alpha: 1)
            }

            selectedIndexPaths.remove(indexPath)
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let weekdayName = getWeekdayName(for: indexPath.row)
        let font = UIFont.systemFont(ofSize: 17)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (weekdayName as NSString).size(withAttributes: attributes)

        let cellWidth = size.width + 16
        let cellHeight = bounds.height - 15

        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    // MARK: - Utility
    func getWeekdayName(for index: Int) -> String {
        let calendar = Calendar.current
        let weekdays = calendar.weekdaySymbols

        let adjustedIndex = (index + calendar.firstWeekday) % 7
        if adjustedIndex < 0 {
            return weekdays[adjustedIndex + 7]
        } else {
            return weekdays[adjustedIndex]
        }
    }
}
