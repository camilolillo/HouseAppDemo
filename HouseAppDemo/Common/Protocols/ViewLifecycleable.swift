//
//  ViewLifecycleable.swift
//

// MARK: - ViewLifecycleable
protocol ViewLifecycleable: AnyObject {
    func onViewDidLoad()
    func onViewWillAppear()
    func onViewWillLayoutSubviews()
    func onViewDidLayoutSubviews()
    func onViewDidAppear()
    func onViewWillDisappear()
}

// MARK: - Default Impl
extension ViewLifecycleable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
    func onViewWillLayoutSubviews() {}
    func onViewDidLayoutSubviews() {}
    func onViewDidAppear() {}
    func onViewWillDisappear() {}
}
