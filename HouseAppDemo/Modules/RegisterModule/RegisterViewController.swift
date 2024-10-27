//
//  RegisterViewController.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation

import Foundation

final class RegisterViewController: BaseViewController {
    var viewModel: RegisterViewModelProtocol?
}

extension RegisterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel?.onViewDidLoad()
    }
}

extension RegisterViewController: RegisterViewProtocol { }
