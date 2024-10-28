//
//  LoginWireframe.swift
//  Created on 27-10-24.
//


import UIKit

typealias LoginDelegate = BaseModuleDelegate & RegisterModuleRequestable & RestartAppRequestable

enum LoginWireframe {
    static func createModule(with delegate: LoginDelegate) -> UIViewController {
        let loginUserUseCase = LoginUserUseCase()
        let view = LoginViewController()
        let viewModel = LoginViewModel(loginUserUseCase: loginUserUseCase)
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.delegate = delegate
        
        return view
    }
}

