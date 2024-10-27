//
//  BaseCell.swift
//

import UIKit

// MARK: - BaseCell
class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder is not supported")
    }

    override class var requiresConstraintBasedLayout: Bool { true }

    func setupCell() { }
}
