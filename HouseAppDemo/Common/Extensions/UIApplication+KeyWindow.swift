//
//  UIApplication+KeyWindow.swift
//

import UIKit

// MARK: - KeyWindow
extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? { windows.first { $0.isKeyWindow } }
}   
