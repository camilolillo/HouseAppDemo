//
//  RegisterViewModel.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation

final class RegisterViewModel {
    weak var view: RegisterViewProtocol?
    weak var delegate: RegisterDelegate?
}

extension RegisterViewModel: RegisterViewModelProtocol { }
