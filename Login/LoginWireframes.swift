import UIKit

typealias LoginDelegate = BaseModuleDelegate

enum LoginWireframes {
    static func createModule(with delegate: LoginDelegate) -> UIViewController {
        let view = LoginViewController()
        let viewModel = LoginViewModel()
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.delegate = delegate
        
        return view
    }
}
