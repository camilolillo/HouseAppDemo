//
//  SplashWireframe.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation
import UIKit

typealias SplashDelegate = BaseModuleDelegate & LoginModuleRequestable & HomeModuleRequestable

enum SplashWireframe {
    static func createModule(with delegate: SplashDelegate) -> UIViewController {
        let view = SplashViewController()
        let viewModel = SplashViewModel()
        
        view.viewModel = viewModel
        viewModel.view = view 
        viewModel.delegate = delegate
        
        return view
        
    }
}
