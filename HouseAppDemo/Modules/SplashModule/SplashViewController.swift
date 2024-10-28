//
//  SplashViewController.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import Foundation

final class SplashViewController: BaseViewController {
    var viewModel: SplashViewModel?
}

extension SplashViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewDidLoad()
    }
}
