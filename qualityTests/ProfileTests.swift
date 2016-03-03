//
//  ProfileTests.swift
//  quality
//
//  Created by Marcus Vinicius Kuquert on 3/2/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import XCTest
@testable import quality

class ProfileTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        weak var expectation = expectationWithDescription("loginFunction")
        
        APIManager.login(user: "ash", password: "mist") { (success, error, trainer) -> () in
            expectation?.fulfill()
        }
        
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            if error == nil{
                XCTAssertEqual(APIManager.sharedInstance.currentTrainer?.onHandPokemons?.count, 6)
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
