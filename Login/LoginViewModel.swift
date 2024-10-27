import Foundation

final class LoginViewModel {
    weak var view: LoginViewProtocol?
    weak var delegate: LoginDelegate?
}

extension LoginViewModel: LoginViewModelProtocol { }
