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
    
    var train: Trainer?
    
    override func setUp() {
        super.setUp()
        APIManager.login(user: "ash", password: "mistyS2") { (success, error, trainer) -> () in
            self.train = trainer
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        print("passou")
//        weak var expectation = expectationWithDescription("loginFunction")
//        
//        APIManager.login(user: "ash", password: "mist") { (success, error, trainer) -> () in
//            expectation?.fulfill()
//        }
        
//        waitForExpectationsWithTimeout(5) { (error) -> Void in
//            if error == nil{
                XCTAssertEqual(self.train!.onHandPokemons?.count, 6)
//            }
//        }
    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
