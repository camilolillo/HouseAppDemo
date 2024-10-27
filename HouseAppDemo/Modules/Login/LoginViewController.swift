//
//  LoginViewController.swift
//  Created on 27-10-24.
//


import UIKit

final class LoginViewController: BaseViewController {
    var viewModel: LoginViewModelProtocol?
}

extension LoginViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewDidLoad()
    }
}

extension LoginViewController: LoginViewProtocol { }

