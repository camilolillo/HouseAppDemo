//
//  UIApplication+TopMostViewController.swift
//

import UIKit

// MARK: - Top Most ViewController
extension UIApplication {
    var topMostViewController: UIViewController? { keyWindowInConnectedScenes?.rootViewController?.topMostViewController }
}
