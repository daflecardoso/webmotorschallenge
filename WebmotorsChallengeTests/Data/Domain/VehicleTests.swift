//
//  VehicleTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 29/01/22.
//

import XCTest
@testable import WebmotorsChallenge

class VehicleTests: XCTestCase {

    func testFormattedAttributes() {
        let vehicle = Vehicle(
            id: 1,
            make: "Honda",
            model: "Civic",
            version: "2.0 EXS",
            image: "http://some.com.br",
            km: 10,
            price: "20000,00",
            yearModel: 2020,
            yearFab: 2019,
            color: "Cinza"
        )
        XCTAssertEqual(vehicle.imageUrl, "https://some.com.br")
        XCTAssertEqual(vehicle.kmFormatted, "10 km")
        XCTAssertEqual(vehicle.priceFormatted, "R$ 20.000,00")
        XCTAssertEqual(vehicle.yearFormatted, "2019/2020")
    }
}
