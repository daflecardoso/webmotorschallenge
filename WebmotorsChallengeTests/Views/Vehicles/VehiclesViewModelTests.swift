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
    
    private func makeViewModelInstance(type: FakeVehiclesService.RequestType) -> VehiclesViewModel {
        let fakeService = FakeVehiclesService(type: type)
        let fakeRepository = FakeVehiclesRepository(service: fakeService)
        return VehiclesViewModel(vehicleRepository: fakeRepository)
    }
    
    func testSuccessVehicles() {
        let viewModel = makeViewModelInstance(type: .success)
        viewModel.fetch()
        let items = viewModel.items
        XCTAssertEqual(items.count, 10)
    }
    
    func testSuccessPaginating() {
        let viewModel = makeViewModelInstance(type: .success)
        viewModel.fetch()
        viewModel.fetch()
        viewModel.fetch()
        let items = viewModel.items
        XCTAssertEqual(items.count, 30)
    }
    
    func testSuccessRefreshing() {
        let viewModel = makeViewModelInstance(type: .success)
        viewModel.fetch()
        viewModel.fetch()
        viewModel.fetch()
        viewModel.refresh()
        let items = viewModel.items
        XCTAssertEqual(items.count, 10)
    }
    
    func testSuccessEmpty() {
        let viewModel = makeViewModelInstance(type: .empty)
        let items = viewModel.items
        XCTAssertEqual(items.count, 0)
    }
    
    func testRequestError() {
        let viewModel = makeViewModelInstance(type: .error)
        viewModel.fetch()
        let items = viewModel.items
        XCTAssertEqual(items.count, 0)
    }
}
