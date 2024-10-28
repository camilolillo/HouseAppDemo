//
//  SplashViewModel.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation

final class SplashViewModel {
    weak var view: SplashViewController?
    weak var delegate: SplashDelegate?
    
    func onViewDidLoad() {
        checkForStoredUser()
    }

    private func checkForStoredUser() {
        if let userData = UserDefaults.standard.data(forKey: .currentUser),
           let user = try? JSONDecoder().decode(User.self, from: userData) {
            delegate?.onHomeModuleRequested(with: user)
        } else {
            delegate?.onLoginModuleRequested()
        }
    }
}
