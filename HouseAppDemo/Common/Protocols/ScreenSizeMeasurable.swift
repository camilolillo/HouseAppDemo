//
//  ScreenSizeMeasurable.swift
//

import UIKit

// MARK: - ScreenSizeMeasurable
protocol ScreenSizeMeasurable: AnyObject {
    var screenHeight: Double { get }
    var screenWidth: Double { get }
}

// MARK: - Default Implementation
extension ScreenSizeMeasurable {
    var screenHeight: Double { .init(UIScreen.main.bounds.height) }
    var screenWidth: Double { .init(UIScreen.main.bounds.width) }
}

// MARK: - where Self: UIViewController
extension ScreenSizeMeasurable where Self: UIViewController {
    var screenHeight: Double { .init(screenHeight) }
    var screenWidth: Double { .init(screenWidth) }
}
