//
//  VehiclesViewModelTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import XCTest
import RxSwift
import RxCocoa
@testable import WebmotorsChallenge

class VehiclesViewModelTests: XCTestCase {
    
    func testSuccessVehicles() {
        let service = FakeVehiclesService(type: .success)
        let viewModel = VehiclesViewModel(vehicleService: service)
        viewModel.fetch()
        let items = viewModel.items
        XCTAssertEqual(items.count, 10)
    }
    
    func testSuccessPaginating() {
        let service = FakeVehiclesService(type: .success)
        let viewModel = VehiclesViewModel(vehicleService: service)
        viewModel.fetch()
        viewModel.fetch()
        viewModel.fetch()
        let items = viewModel.items
        XCTAssertEqual(items.count, 30)
    }
    
    func testSuccessRefreshing() {
        let service = FakeVehiclesService(type: .success)
        let viewModel = VehiclesViewModel(vehicleService: service)
        viewModel.fetch()
        viewModel.fetch()
        viewModel.fetch()
        viewModel.refresh()
        let items = viewModel.items
        XCTAssertEqual(items.count, 10)
    }
    
    func testSuccessEmpty() {
        let service = FakeVehiclesService(type: .success)
        let viewModel = VehiclesViewModel(vehicleService: service)
        let items = viewModel.items
        XCTAssertEqual(items.count, 0)
    }
    
    func testRequestError() {
        let service = FakeVehiclesService(type: .error)
        let viewModel = VehiclesViewModel(vehicleService: service)
        viewModel.fetch()
        let items = viewModel.items
        XCTAssertEqual(items.count, 0)
    }
}
