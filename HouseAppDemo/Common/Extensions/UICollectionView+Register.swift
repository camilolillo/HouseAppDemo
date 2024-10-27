//
//  UICollectionView+Register.swift
//

import UIKit

extension UICollectionView {
    @discardableResult func register(_ cellClass: UICollectionReusableView.Type...) -> Self {
        with { collectionView in cellClass.forEach { collectionView.register($0, forCellWithReuseIdentifier: $0.reuseIdentifier) } }
    }
}

extension UICollectionView {
    @discardableResult func register(_ reusableViewClass: UICollectionReusableView.Type..., kind: SupplementaryViewKind) -> Self {
        with { collectionView in reusableViewClass.forEach { collectionView.register($0, forSupplementaryViewOfKind: kind.asString, withReuseIdentifier: $0.reuseIdentifier) }
        }
    }
}

// MARK: - SupplementaryViewKind
enum SupplementaryViewKind: Stringable {
    case header
    case footer

    var asString: String {
        switch self {
        case .header: return UICollectionView.elementKindSectionHeader
        case .footer: return UICollectionView.elementKindSectionFooter
        }
    }
}
