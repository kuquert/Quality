//
//  LoginTests.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 3/2/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import XCTest
@testable import quality

class LoginTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginTrue(){
        weak var expectation = expectationWithDescription("loginFunction")
        
        APIManager.login(user: "ash", password: "mistyS2") { (success, error, trainer) in
            XCTAssertTrue(success, "Tudo ok com o loginTrue")
            expectation?.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error, "expectation timout")
        }
    }
    
    func testLoginWrongUsername(){
        weak var expectation = expectationWithDescription("loginFunction")
        
        APIManager.login(user: "bla", password: "mistyS2") { (success, error, trainer) in
            XCTAssertFalse(success, "Tudo ok com o loginTrue")
            expectation?.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error, "expectation timout")
        }
    }
    
    func testLoginWrongPassword(){
        weak var expectation = expectationWithDescription("loginFunction")
        
        APIManager.login(user: "ash", password: "bla") { (success, error, trainer) in
            XCTAssertFalse(success, "Tudo ok com o loginTrue")
            expectation?.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error, "expectation timout")
        }
    }
    
}
