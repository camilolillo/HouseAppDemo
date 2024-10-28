//
//  LoginViewModel.swift
//  Created on 27-10-24.
//

import Foundation

struct LoginForm {
    var email: String?
    var password: String?
}

final class LoginViewModel {
    weak var view: LoginViewController?
    weak var delegate: LoginDelegate?
    
    private var loginForm = LoginForm()
    private let loginUserUseCase: LoginUserUseCaseProtocol
    
    var onLoadingStateChange: ((Bool) -> Void)?
    var onErrorMessageChange: ((String?) -> Void)?
    var onSuccessMessageChange: ((String) -> Void)?
    var onEmailChange: ((String) -> Void)?
    var onPasswordChange: ((String) -> Void)?
    var onLoginAction: (() -> Void)?
    var onRegisterAction: (() -> Void)?
    
    init(loginUserUseCase: LoginUserUseCaseProtocol) {
        self.loginUserUseCase = loginUserUseCase
        setupBindings()
    }
    
    private func setupBindings() {
        onEmailChange = { [weak self] email in
            self?.loginForm.email = email
        }
        
        onPasswordChange = { [weak self] password in
            self?.loginForm.password = password
        }
    }
}

extension LoginViewModel {
    func onLoginButtonPressed() {
        onLoadingStateChange?(true)
        validateCredentials()
    }

    func onRegisterButtonPressed() {
        delegate?.onRegisterModuleRequested()
    }

    private func validateCredentials() {
        guard
            let email = loginForm.email, !email.isEmpty,
            let password = loginForm.password, !password.isEmpty else {
            onErrorMessageChange?(.completeFieldsMessage)
                onLoadingStateChange?(false)
                return
        }
        
        loginUserUseCase.execute(email: email, password: password) { [weak self] success, message in
            self?.onLoadingStateChange?(false)
            if success {
                self?.onSuccessMessageChange?(.loginSuccessMessage)
                self?.onLoginAction = {
                    self?.delegate?.onDismissRequested()
                }
            } else {
                self?.onErrorMessageChange?(.loginErrorMessage)
            }
        }
    }
}
