//
//  UIViewController+IsPresenting.swift
//

import UIKit

// MARK: - isPresenting
extension UIViewController {
    var isPresenting: Bool { presentedViewController.isNotNil }
}
