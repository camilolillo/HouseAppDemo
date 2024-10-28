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
    
    var onLoadingStateChange: ((Bool) -> Void)?
    var onEmailChange: ((String) -> Void)?
    var onPasswordChange: ((String) -> Void)?
    var onConfirmPasswordChange: ((String) -> Void)?
    
    
    init() {
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
        print("\(registerForm as Any)")
    }
}
