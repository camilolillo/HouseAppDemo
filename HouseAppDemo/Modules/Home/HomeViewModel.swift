//
//  HomeViewModel.swift
//  Created on 28-10-24.
//

import Foundation

final class HomeViewModel {
    weak var view: HomeViewController?
    weak var delegate: HomeDelegate?
    private var signOutUseCase: SignOutUseCase?
    
    init(user: User, signOutUseCase: SignOutUseCase) {
        self.signOutUseCase = signOutUseCase
        print(user)
        setupBindings()
    }

    private func setupBindings() {}
}

extension HomeViewModel {
    func onSignOutButtonPressed() {
        signOutUseCase?.execute() { success, message in
            self.delegate?.onRestartAppRequested()
        }
    }
}
