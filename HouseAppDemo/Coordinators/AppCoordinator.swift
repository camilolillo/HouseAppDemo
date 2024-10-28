//
//  AppCoordinator.swift
//
//  Created by Camilo Lillo on 16-03-23.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private var searchNavigationControllerToPresent: UINavigationController? {
        didSet {
            guard let searchNavigationControllerToPresent else { return }
            navigationController.present(searchNavigationControllerToPresent, animated: true)
        }
    }
    
    private var presentedViewController: UIViewController? {
        didSet {
            guard let presentedViewController else { return }
            navigationController.present(presentedViewController, animated: true)
        }
    }
    
    override func start() {
        let vc = SplashWireframe.createModule(with: self)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    override func onDismissRequested() {
        presentedViewController?.dismiss(animated: true)
    }
    
}

extension AppCoordinator: RestartAppRequestable {
    func onRestartAppRequested() {
        let vc = SplashWireframe.createModule(with: self)
        navigationController.setViewControllers([vc], animated: true)
    }
}

extension AppCoordinator: LoginModuleRequestable {
    func onLoginModuleRequested() {
        let vc = LoginWireframe.createModule(with: self)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: RegisterModuleRequestable {
    func onRegisterModuleRequested() {
        let vc = RegisterWireframe.createModule(with: self)
        self.presentedViewController = vc
    }
}

extension AppCoordinator: HomeModuleRequestable {
    func onHomeModuleRequested(with user: User) {
        let vc = HomeWireframe.createModule(with: user, with: self)
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.setViewControllers([vc], animated: false)
    }
}
