//
//  RegisterViewModel.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation

struct RegisterForm {
    var email: String?
    var password: String?
    var confirmPassword: String?
}

final class RegisterViewModel {
    weak var view: RegisterViewController?
    weak var delegate: RegisterDelegate?
    
    private var registerForm = RegisterForm()
    private let registerUserUseCase: RegisterUserUseCaseProtocol
    
    var onLoadingStateChange: ((Bool) -> Void)?
    var onErrorMessageChange: ((String?) -> Void)?
    var onSuccessMessageChange: ((String) -> Void)?
    var onEmailChange: ((String) -> Void)?
    var onPasswordChange: ((String) -> Void)?
    var onConfirmPasswordChange: ((String) -> Void)?
    var onSuccessAction: (() -> Void)?
    
    init(registerUserUseCase: RegisterUserUseCaseProtocol) {
        self.registerUserUseCase = registerUserUseCase
        setupBindings()
    }
    
    private func setupBindings() {
        onEmailChange = { [weak self] email in
            self?.registerForm.email = email
        }
        
        onPasswordChange = { [weak self] password in
            self?.registerForm.password = password
        }
        
        onConfirmPasswordChange = { [weak self] confirmPassword in
            self?.registerForm.confirmPassword = confirmPassword
        }
    }
    
}

extension RegisterViewModel {
    func onRegisterButtonPressed() {
        onLoadingStateChange?(true)
        validateCredentials()
    }
    func validateCredentials() {
        guard
            let email = registerForm.email, !email.isEmpty,
            let password = registerForm.password, !password.isEmpty,
            let confirmPassword = registerForm.confirmPassword, !confirmPassword.isEmpty else {
                onErrorMessageChange?("Debes completar los campos")
                onLoadingStateChange?(false)
                return
        }
        guard password.elementsEqual(confirmPassword) else {
            onErrorMessageChange?("Las contraseñas no coinciden")
            onLoadingStateChange?(false)
            return
        }
        registerUserUseCase.execute(email: email, password: password) { success, message in
            self.onLoadingStateChange?(false)
            if success {
                self.onSuccessMessageChange?("Registro exitoso")
                self.onSuccessAction = {
                    self.delegate?.onDismissRequested()
                }
            } else {
                self.onErrorMessageChange?(message)
            }
        }
    }
}
