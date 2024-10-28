//
//  RegisterViewController.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation
import UIKit

final class RegisterViewController: BaseViewController {
    var viewModel: RegisterViewModelProtocol?

    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onRegisterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bindViewModel()
    }
    
    private func setupUI() {
        view.addSubview(registerButton)
        registerButton.addSubview(activityIndicator)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            activityIndicator.centerXAnchor.constraint(equalTo: registerButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: registerButton.centerYAnchor)
        ])
    }

    private func bindViewModel() {
        viewModel?.onLoadingStateChange = { [weak self] isLoading in
            self?.updateButtonState(isLoading: isLoading)
        }
    }
    
    private func updateButtonState(isLoading: Bool) {
        if isLoading {
            registerButton.setTitle("", for: .normal)
            activityIndicator.startAnimating()
        } else {
            registerButton.setTitle("Register", for: .normal)
            activityIndicator.stopAnimating()
        }
    }

    @objc private func onRegisterButtonPressed() {
        viewModel?.onRegisterButtonPressed()
    }
}

extension RegisterViewController: RegisterViewProtocol { }

