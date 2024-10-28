//
//  HomeViewController.swift
//  Created on 28-10-24.
//

import UIKit

final class HomeViewController: UIViewController {
    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        setupConstraints()
        bindViewModel() 
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }

    private func setupConstraints() { }

    private func bindViewModel() { }

}

extension HomeViewController {
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        
        let signOutButton = UIBarButtonItem(
            image: UIImage(systemName: "power"),
            style: .plain,
            target: self,
            action: #selector(onSignOutButtonPressed)
        )
        signOutButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = signOutButton
    }
}

extension HomeViewController {
    @objc private func onSignOutButtonPressed() {
        viewModel?.onSignOutButtonPressed()
    }
}

