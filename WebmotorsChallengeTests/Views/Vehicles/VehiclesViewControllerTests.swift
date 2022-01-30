//
//  VehiclesViewControllerTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import XCTest
@testable import WebmotorsChallenge

// MARK: Helper extension tests
private extension VehiclesViewController {
    
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

class VehiclesViewControllerTests: XCTestCase {
    
    private var window: UIWindow? = UIApplication.keyWindow
    
    private func makeViewInstance(type: FakeVehiclesService.RequestType) -> VehiclesViewController {
        let fakeService = FakeVehiclesService(type: type)
        let viewModel = VehiclesViewModel(vehicleService: fakeService)
        return VehiclesViewController(viewModel: viewModel)
    }
    
    func testNumberOfLinesInTableView() {
        let viewController = makeViewInstance(type: .success)
        window?.rootViewController = viewController
        XCTAssertEqual(viewController.tableRows, 10)
    }
    
    func testNumberOfLinesInTableViewWhenItIsPaginating() {
        let viewController = makeViewInstance(type: .success)
        window?.rootViewController = viewController
        XCTAssertEqual(viewController.tableRows, 10)
        viewController.scrollTo(row: 9)
        XCTAssertEqual(viewController.tableRows, 20)
        viewController.scrollTo(row: 19)
        XCTAssertEqual(viewController.tableRows, 30)
        viewController.scrollTo(row: 20)
        XCTAssertEqual(viewController.tableRows, 30)
    }
    
    func testNumberOfLinesInTableViewWhenItRefresh() {
        let viewController = makeViewInstance(type: .success)
        window?.rootViewController = viewController
        XCTAssertEqual(viewController.tableRows, 10)
        viewController.scrollTo(row: 9)
        XCTAssertEqual(viewController.tableRows, 20)
        viewController.scrollTo(row: 19)
        XCTAssertEqual(viewController.tableRows, 30)
        viewController.scrollTo(row: 20)
        XCTAssertEqual(viewController.tableRows, 30)
        viewController.swipe()
        XCTAssertEqual(viewController.tableRows, 10)
    }
    
    func testNumberOfLinesInTableViewEmptyRespone() {
        let viewController = makeViewInstance(type: .empty)
        window?.rootViewController = viewController
        XCTAssertEqual(viewController.tableRows, 0)
    }
    
    func testNumberOfLinesInTableViewErrorRespone() {
        let viewController = makeViewInstance(type: .error)
        window?.rootViewController = viewController
        XCTAssertEqual(viewController.tableRows, 0)
    }
}
