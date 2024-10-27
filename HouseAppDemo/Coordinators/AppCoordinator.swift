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
    
    override func start() {
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
        navigationController.present(vc, animated: true)
    }
}
