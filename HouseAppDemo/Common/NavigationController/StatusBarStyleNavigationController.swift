//
//  StatusBarStylableNavigationController.swift
//

import UIKit

// MARK: - StatusBarStylableNavigationController
final class StatusBarStylableNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? .lightContent
    }
}
