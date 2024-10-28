//
//  LoginViewModel.swift
//  Created on 27-10-24.
//


import Foundation

final class LoginViewModel {
    weak var view: LoginViewController?
    weak var delegate: LoginDelegate?
}

extension LoginViewModel {
    func onLoginButtonPressed() {
        //TODO
    }
    func onRegisterButtonPressed() {
        delegate?.onRegisterModuleRequested()
    }
}

