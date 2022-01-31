//
//  VehicleDetailViewControllerTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 31/01/22.
//

import XCTest
@testable import WebmotorsChallenge

// MARK: Helper extension tests
private extension VehicleDetailViewController {
    
    var tableRows: Int {
        return tableView.numberOfRows(inSection: 0)
    }
    
    func scrollTo(row: Int) {
        tableView.toRow(row: row)
    }
    
    func swipe() {
        tableView.refreshControl?.sendActions(for: .valueChanged)
    }
}

class VehicleDetailViewControllerTests: XCTestCase {

    private var window: UIWindow? = UIApplication.keyWindow
    
    private func makeViewInstance() -> VehicleDetailViewController {
        let vehicle = Vehicle.fakeInstance
        let viewModel = VehicleDetailViewModel(vehicle: vehicle)
        return VehicleDetailViewController(viewModel: viewModel)
    }
    
    func testNumberOfLinesInTableView() {
        let viewController = makeViewInstance()
        window?.rootViewController = viewController
        XCTAssertEqual(viewController.tableRows, 4)
    }
    
    func testTitleView() {
        let viewController = makeViewInstance()
        window?.rootViewController = viewController
        XCTAssertTrue(viewController.navigationItem.titleView is UIStackView)
    }
    
    func testRegisteredClasses() {
        let viewController = makeViewInstance()
        window?.rootViewController = viewController
        let shouldRegistered: [String] = [
            "VehicleInfoCell",
            "PhotosCell",
            "VehicleDetailCell",
            "VehiclePriceCell"
        ]
        let keys = viewController.tableView.registeredClasses.keys
        shouldRegistered.forEach { XCTAssertTrue(keys.contains($0)) }
    }
}
