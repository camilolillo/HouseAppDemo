//
//  LoginWireframe.swift
//  Created on 27-10-24.
//


import UIKit

typealias LoginDelegate = BaseModuleDelegate

enum LoginWireframe {
    static func createModule(with delegate: LoginDelegate) -> UIViewController {
        let view = LoginViewController()
        let viewModel = LoginViewModel()
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.delegate = delegate
        
        return view
    }
}

