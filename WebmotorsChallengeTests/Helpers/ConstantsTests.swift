//
//  ConstantsTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import XCTest
@testable import WebmotorsChallenge

class ConstantsTests: XCTestCase {

    func testValuesContants() {
        XCTAssertEqual(Constants.cardRadius, 16)
        XCTAssertEqual(Constants.margin, 16)
    }
}
