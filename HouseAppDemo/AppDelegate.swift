//
//  AppDelegate.swift
//  HouseAppDemo
//
//  Created by Camilo Lillo on 27-10-24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appCoordinator: AppCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setInitialVC()
        return true
    }


}

extension AppDelegate {
    // MARK: - setInitialVC
    private func setInitialVC() {
        let nc = StatusBarStylableNavigationController()
        appCoordinator = AppCoordinator(navigationController: nc)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        window?.tintColor = .systemBlue
        appCoordinator?.start()
    }
}

