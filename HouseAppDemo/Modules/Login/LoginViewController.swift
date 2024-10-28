//
//  LoginViewController.swift
//  Created on 27-10-24.
//

import UIKit

final class LoginViewController: BaseViewController {
    var viewModel: LoginViewModel?

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = .emailPlaceholder
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(onEmailChanged(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = .passwordPlaceholder
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(onPasswordChanged(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(.loginButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onLoginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(.registerButtonTitle, for: .normal)
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
        indicator.color = .white
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bindViewModel()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        loginButton.addSubview(activityIndicator)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            registerButton.heightAnchor.constraint(equalToConstant: 44),
            
            activityIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor)
        ])
    }

    private func bindViewModel() {
        viewModel?.onLoadingStateChange = { [weak self] isLoading in
            self?.updateButtonState(isLoading: isLoading)
        }
        viewModel?.onErrorMessageChange = { [weak self] message in
            guard let message = message else { return }
            self?.showAlert(message: message, action: nil)
        }
        viewModel?.onSuccessMessageChange = { [weak self] successMessage in
            self?.showAlert(message: successMessage) {
                self?.viewModel?.onLoginAction?()
            }
        }
    }
}

extension LoginViewController {
    private func showAlert(message: String, action: (() -> Void)?) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in action?() }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func updateButtonState(isLoading: Bool) {
        if isLoading {
            loginButton.setTitle(.empty, for: .normal)
            activityIndicator.startAnimating()
        } else {
            loginButton.setTitle(.loginButtonTitle, for: .normal)
            activityIndicator.stopAnimating()
        }
    }
}

extension LoginViewController {
    @objc private func onLoginButtonPressed() {
        viewModel?.onLoginButtonPressed()
    }

    @objc private func onRegisterButtonPressed() {
        viewModel?.onRegisterButtonPressed()
    }

    @objc private func onEmailChanged(_ textField: UITextField) {
        viewModel?.onEmailChange?(textField.text ?? .empty)
    }

    @objc private func onPasswordChanged(_ textField: UITextField) {
        viewModel?.onPasswordChange?(textField.text ?? .empty)
    }
}
