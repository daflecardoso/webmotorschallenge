//
//  StringExtensionsTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import XCTest
@testable import WebmotorsChallenge

class StringExtensionsTests: XCTestCase {

    func testSuccessUrl() {
        let urlString = "http://some.com"
        let url = try? urlString.url()
        XCTAssertNotNil(url)
    }
    
    func testFailureUrl() {
        let urlString = "htt//some.com"
        let url = try? urlString.url()
        XCTAssertNil(url?.baseURL)
    }
    
    func testDigits() {
        XCTAssertEqual("123ABC".digits, "123")
    }
}
