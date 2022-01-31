//
//  WebmotorsChallengeUITests.swift
//  WebmotorsChallengeUITests
//
//  Created by Dafle on 28/01/22.
//

import XCTest

class WebmotorsChallengeUITests: XCTestCase {
    
    private let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launchArguments.append("UITest")
        continueAfterFailure = false
    }

    func testSuccess() throws {
        app.launchEnvironment["current_mock"] = "vehicles_success_response"
        app.launch()
        
        app.swipeDown()
        
        app.tables.cells.staticTexts["2.0 EXL 4X4 16V GASOLINA 4P AUTOMÁTICO"].tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func testEmpty() throws {
        app.launchEnvironment["current_mock"] = "vehicles_empty_response"
        app.launch()
        
        XCTAssertTrue(app.tables.cells.count == 0)
    }
    
    func testError() throws {
        app.launchEnvironment["current_mock"] = "vehicles_error_response"
        app.launch()
        XCTAssertTrue(app.tables.cells.count == 0)
    }
}
