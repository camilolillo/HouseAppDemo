//
//  RegisterViewModel.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation
import Combine

final class RegisterViewModel {
    weak var view: RegisterViewProtocol?
    weak var delegate: RegisterDelegate?
    
    var onLoadingStateChange: ((Bool) -> Void)?
    
}

extension RegisterViewModel: RegisterViewModelProtocol {
    func onRegisterButtonPressed() {
        onLoadingStateChange?(true)
    }
}
