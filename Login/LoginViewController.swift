import UIKit

final class LoginViewController: BaseViewController {
    var viewModel: LoginViewModelProtocol?
}

extension LoginViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController: LoginViewProtocol { }
