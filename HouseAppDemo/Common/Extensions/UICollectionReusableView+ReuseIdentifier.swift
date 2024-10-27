//
//  UICollectionReusableView+ReuseIdentifier.swift
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String { .init(describing: self) }
}
