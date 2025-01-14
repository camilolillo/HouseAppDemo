//
//  SplashViewModel.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation

final class SplashViewModel {
    weak var view: SplashViewProtocol?
    weak var delegate: SplashDelegate?
}

extension SplashViewModel {
    func onViewDidLoad() {
        delegate?.onLoginModuleRequested()
    }
}

extension SplashViewModel: SplashViewModelProtocol { }
