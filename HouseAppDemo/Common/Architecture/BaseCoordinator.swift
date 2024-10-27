//
//  BaseCoordinator.swift
//

import UIKit

// MARK: - BaseCoordinator
class BaseCoordinator: NSObject, Coordinator, BaseCoordinatorParent, BaseModuleDelegate {
    let navigationController: UINavigationController
    
    init(navigationController: @autoclosure () -> UINavigationController) {
        self.navigationController = navigationController()
    }

    private var _childCoordinators: [Coordinator] = [] {
        didSet {
            print("\n\(Self.self).\(#function): \(_childCoordinators)\n")
        }
    }

    private var childCoordinators: [Coordinator] {
        get { queue.sync { self._childCoordinators } }
        set { queue.async(flags: .barrier) { self._childCoordinators = newValue } }
    }

    private lazy var queue: DispatchQueue = .init(
        label: "\(Bundle.main.bundleIdentifier ?? "*").\(Self.self).queue",
        attributes: .concurrent
    )

    // MARK: - Coordinator
    func start() {}


    // MARK: - BaseCoordinatorParent

    /// By default it removes the received coordinator from child coordinators.
    /// - parameter coordinator: Coordinator that performed the current onProcessDone method call
    func onProcessDone(by coordinator: some Coordinator) {
        print("\n\(Self.self).\(#function) coordinator: \(coordinator)")
        removeChild(coordinator: coordinator)
    }

    // MARK: - BaseModuleDelegate

    /// By default it dismisses the currently presented view controller, if there is any,
    func onDismissRequested() { dismissPresentedViewController(completion: nil) }

    /// By default it pops the top view controller from the navigation controller.
    func onGoBackRequested() { navigationController.popViewController(animated: true) }
}

// MARK: - Convenience child coordinators methods
extension BaseCoordinator {
    func addChild(coordinator: some Coordinator) {
        removeChild(coordinator: coordinator)
        print("\n\(Self.self).\(#function) coordinator: \(coordinator))")
        childCoordinators.append(coordinator)
    }

    func addChildAndStart(coordinator: some Coordinator) {
        print("\n\(Self.self).\(#function) coordinator: \(coordinator))")
        addChild(coordinator: coordinator)
        coordinator.start()
    }

    func getChild<T>(of type: T.Type) -> T? where T: Coordinator {
        print("\n\(Self.self).\(#function) type: \(type))")
        return childCoordinators.getFirst(of: T.self)
    }

    func removeChild<T>(coordinator: T) where T: Coordinator {
        guard childCoordinators.contains(where: { $0 is T }) else { return }
        print("\n\(Self.self).\(#function) coordinator: \(coordinator))")
        childCoordinators.removeAll(of: T.self)
    }
}

// MARK: - Convenience presentation methods
extension BaseCoordinator {
    func dismissPresentedViewController(completion: CompletionHandler) {
        navigationController.dismissPresentedViewController(completion: completion)
    }
}
// MARK: - AlertPresentable
extension BaseCoordinator: AlertPresentable {}
