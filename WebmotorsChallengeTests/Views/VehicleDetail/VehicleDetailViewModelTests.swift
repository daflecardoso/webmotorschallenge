//
//  VehicleDetailViewModelTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 31/01/22.
//

import XCTest
@testable import WebmotorsChallenge

extension VehicleDetailCellType: Equatable {
    
    public static func == (lhs: VehicleDetailCellType, rhs: VehicleDetailCellType) -> Bool {
        switch (lhs, rhs) {
        case (let .photos(lhsImageUrl), let .photos(rhsImageUrl)):
            return lhsImageUrl == rhsImageUrl
        case (let .vehicle(lhsVehicle), let .vehicle(rhsVehicle)):
            return lhsVehicle.id == rhsVehicle.id
        case (let .price(lhsPrice), let .price(rhsPrice)):
            return lhsPrice == rhsPrice
        case (let .detail(lhsVehicle), let .detail(rhsVehicle)):
            return lhsVehicle.id == rhsVehicle.id
        default:
            return false
        }
    }
}

class VehicleDetailViewModelTests: XCTestCase {
    
    func testItemsVehicleDetail() {
        let vehicle = Vehicle(
            id: 1,
            make: "honda",
            model: "city",
            version: "2.0",
            image: "https://some.com",
            km: 0,
            price: "10000,00",
            yearModel: 2020,
            yearFab: 2019,
            color: "Branca"
        )
        let viewModel = VehicleDetailViewModel(vehicle: vehicle)
        viewModel.fetch()
        XCTAssertEqual(viewModel.items.count, 4)
    }
    
    func testSequenceItems() {
        let vehicle = Vehicle(
            id: 1,
            make: "honda",
            model: "city",
            version: "2.0",
            image: "https://some.com",
            km: 0,
            price: "10000,00",
            yearModel: 2020,
            yearFab: 2019,
            color: "Branca"
        )
        let sequence: [VehicleDetailCellType] = [
            .photos(vehicle.imageUrl),
            .vehicle(vehicle),
            .price(vehicle.priceFormatted),
            .detail(vehicle)
        ]
        let viewModel = VehicleDetailViewModel(vehicle: vehicle)
        viewModel.fetch()
        XCTAssertEqual(viewModel.items.count, sequence.count)
        zip(sequence, viewModel.items).forEach { XCTAssertEqual($0, $1) }
    }
}
