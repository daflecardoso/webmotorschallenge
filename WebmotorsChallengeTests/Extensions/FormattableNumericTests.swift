//
//  FormattableNumericTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import XCTest
@testable import WebmotorsChallenge

class FormattableNumericTests: XCTestCase {

    func testDecimalCoin() {
        let num = 1098
        XCTAssertEqual(num.toDecimalCoin(), "R$ 10,98")
    }

    func testToCoin() {
        let num = 1000
        XCTAssertEqual(num.toCoin(), "R$ 1.000,00")
    }
    
    func testToNumber() {
        let num = 1000
        XCTAssertEqual(num.toNumber(), "1.000")
    }
}
