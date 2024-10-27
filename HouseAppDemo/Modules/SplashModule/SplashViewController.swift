//
//  SplashViewController.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation

final class SplashViewController: BaseViewController {
    var viewModel: SplashViewModelProtocol?
}

extension SplashViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewDidLoad()
    }
}

extension SplashViewController: SplashViewProtocol { }
