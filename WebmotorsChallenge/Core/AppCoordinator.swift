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
    
    func start() {
        self.navigateToHome()
    }
    
    func navigateToHome() {
        window.rootViewController = DefaultNavigationController(
            rootViewController: makeVehiclesViewController()
        )
        window.makeKeyAndVisible()
    }
    
    private func makeVehiclesViewController() -> VehiclesViewController {
        let vehicleService = VehicleService()
        let viewModel = VehiclesViewModel(vehicleService: vehicleService)
        return VehiclesViewController(viewModel: viewModel)
    }
    
    func makeVechicleDetailViewController(vehicle: Vehicle) -> VehicleDetailViewController {
        let viewModel = VehicleDetailViewModel(vehicle: vehicle)
        return VehicleDetailViewController(viewModel: viewModel)
    }
}
