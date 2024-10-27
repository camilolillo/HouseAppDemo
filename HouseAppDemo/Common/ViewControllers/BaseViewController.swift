//
//  BaseViewController.swift
//

import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {}


// MARK: - Default preferredStatusBarStyle
extension BaseViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
}

// MARK: - Lifecycle
extension BaseViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defer { print("\(Self.self).\(#function)") }
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override func viewDidAppear(_ animated: Bool) {
        defer { print("\(Self.self).\(#function)") }
        super.viewDidAppear(animated)
    }

    override func viewWillLayoutSubviews() {
        defer { print("\(Self.self).\(#function)") }
        super.viewWillLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        defer { print("\(Self.self).\(#function)") }
        super.viewDidLayoutSubviews()
    }

    override func viewWillDisappear(_ animated: Bool) {
        defer { print("\(Self.self).\(#function)") }
        super.viewWillDisappear(animated)
    }
}

// MARK: - UIGestureRecognizerDelegate
extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool { true }
}
