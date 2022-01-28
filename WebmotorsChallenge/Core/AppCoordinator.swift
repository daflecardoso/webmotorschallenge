//
//  AppCoordinator.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private weak var appDelegate: AppDelegate?
    let window : UIWindow
    
    init(appDelegate: AppDelegate, window: UIWindow) {
        self.appDelegate = appDelegate
        self.window = window
    }
    
    private func makeHomeViewController() -> HomeViewController {
        let viewModel = HomeViewModel()
        return HomeViewController(viewModel: viewModel)
    }
    
    func start() {
        self.navigateToHome()
    }
    
    func navigateToHome() {
        let viewController = makeHomeViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
