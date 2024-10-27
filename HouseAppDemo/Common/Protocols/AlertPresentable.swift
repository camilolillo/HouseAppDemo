//
//  AlertPresentable.swift
//

import UIKit

// MARK: - AlertViewType
enum AlertViewType {
    case emptyAlert
    case genericError
    case customAlert(title: String = .defaultAlertTitle, message: String = .empty)
}

// MARK: - AlertPresentable
protocol AlertPresentable: AnyObject {
    var viewController: UIViewController? { get }
    func presentAlertView(type: AlertViewType, acceptAction: ((UIAlertAction) -> Void)?, cancelAction: ((UIAlertAction) -> Void)?)
}

// MARK: - Default implementation
extension AlertPresentable {
    var viewController: UIViewController? { UIApplication.shared.topMostViewController }
    
    func presentAlertView(type: AlertViewType, acceptAction: ((UIAlertAction) -> Void)? = nil, cancelAction: ((UIAlertAction) -> Void)? = nil) {
        var alertTitle: String = .empty
        var alertMessage: String = .empty
        
        switch type {
        case .genericError: alertMessage = .defaultAlertMessage
        case .customAlert(let title, let message):
            alertTitle = title
            alertMessage = message
        case .emptyAlert: break
        }
        
        let alertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: .alert
        )
        
        let acceptAlertAction = UIAlertAction(
            title: .defaultAcceptActionTitle,
            style: .default,
            handler: acceptAction
        )
        
        alertController.addAction(acceptAlertAction)
        
        if let cancelAction = cancelAction {
            let cancelAlertAction = UIAlertAction(
                title: .cancel,
                style: .cancel,
                handler: cancelAction
            )
            
            alertController.addAction(cancelAlertAction)
        }
        
        applyDefaultAlertStyle(
            to: alertController,
            alertTitle: alertTitle,
            alertMessage: alertMessage
        )
        
        guard viewController is UIAlertController else {
            viewController?.present(
                alertController,
                animated: true
            )
            
            return
        }
        
        viewController?.dismiss(animated: false) {
            self.viewController?.present(alertController, animated: true)
        }
    }
}

extension AlertPresentable {
    private func applyDefaultAlertStyle(to alertController: UIAlertController, alertTitle: String, alertMessage: String) {
        alertController.view.tintColor = .white

        let boldFont: UIFont = .boldSystemFont(ofSize: 17)

        let attributedTitle = NSMutableAttributedString(
            string: alertTitle,
            attributes: [
                .font: boldFont,
                .foregroundColor: UIColor.black
            ]
        )

        alertController.setValue(
            attributedTitle,
            forKey: "attributedTitle"
        )

        let regularFont: UIFont = .systemFont(ofSize: 13)

        let attributedMessage = NSMutableAttributedString(
            string: alertMessage,
            attributes: [
                .font: regularFont,
                .foregroundColor: UIColor.black
            ]
        )

        alertController.setValue(
            attributedMessage,
            forKey: "attributedMessage"
        )
    }
}
