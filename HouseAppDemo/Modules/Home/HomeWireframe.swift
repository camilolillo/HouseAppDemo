//
//  HomeWireframe.swift
//  Created on 28-10-24.
//

import UIKit

typealias HomeDelegate = BaseModuleDelegate & RestartAppRequestable

enum HomeWireframe {
    static func createModule(with user: User, with delegate: HomeDelegate) -> UIViewController {
        let signOutUseCase = SignOutUseCase()
        let view = HomeViewController()
        let viewModel = HomeViewModel(user: user, signOutUseCase: signOutUseCase)
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.delegate = delegate
        
        return view
    }
}

