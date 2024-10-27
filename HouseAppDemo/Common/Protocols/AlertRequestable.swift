//
//  AlertRequestable.swift
//

// MARK: - AlertRequestable
protocol AlertRequestable: AnyObject {
    func onPresentAlertRequested(title: String, message: String, handler: CompletionHandler, cancelHandler: CompletionHandler)
}

// MARK: - where Self: AlertPresentable
extension AlertRequestable where Self: AlertPresentable {
    func onPresentAlertRequested(title: String = .defaultAlertTitle, message: String, handler: CompletionHandler = nil, cancelHandler: CompletionHandler = nil) {
        presentAlertView(
            type: .customAlert(title: title, message: message),
            acceptAction: handler.isNotNil ? { _ in handler?() } : nil,
            cancelAction: cancelHandler.isNotNil ? { _ in cancelHandler?() } : nil
        )
    }
}
