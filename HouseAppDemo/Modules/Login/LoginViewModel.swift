//
//  LoginViewModel.swift
//  Created on 27-10-24.
//


import Foundation

final class LoginViewModel {
    weak var view: LoginViewProtocol?
    weak var delegate: LoginDelegate?
}

extension LoginViewModel: LoginViewModelProtocol { }

