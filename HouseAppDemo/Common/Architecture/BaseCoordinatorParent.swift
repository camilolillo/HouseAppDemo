//
//  BaseCoordinatorDelegate.swift
//

// MARK: - BaseCoordinatorParent
protocol BaseCoordinatorParent: AnyObject {
    func onProcessDone(by coordinator: some Coordinator)
}
