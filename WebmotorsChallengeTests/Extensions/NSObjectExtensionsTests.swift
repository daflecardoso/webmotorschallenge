//
//  NSObjectExtensionsTests.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import XCTest
@testable import WebmotorsChallenge

class NSObjectExtensionsTests: XCTestCase {
    
    class FakeObject: NSObject {
        
    }

    func testApply() {
        let object = FakeObject()
        
        let instance = object.apply {
            XCTAssertEqual($0, object)
        }
        XCTAssertEqual(instance, object)
    }

    func testRunFunction() {
        let object = FakeObject()
        
        let stringObject = object.run { it -> String in 
            XCTAssertEqual(it, object)
            return String()
        }
        XCTAssertEqual(stringObject, String())
    }
    
    func testClassName() {
        let object = FakeObject()
        XCTAssertEqual(object.className, "FakeObject")
    }
}
