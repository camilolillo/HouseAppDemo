//
//  RegisterWireframe.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation
import UIKit

typealias RegisterDelegate = BaseModuleDelegate

enum RegisterWireframe {
    static func createModule(with delegate: RegisterDelegate) -> UIViewController {
        let view = RegisterViewController()
        let viewModel = RegisterViewModel()
        
        view.viewModel = viewModel
        viewModel.view = view 
        viewModel.delegate = delegate
        
        return view
        
    }
}
