//
//  qualityUITests.swift
//  qualityUITests
//
//  Created by Marcus Vinicius Kuquert on 2/29/16.
//  Copyright © 2016 Marcus Vinicius Kuquert. All rights reserved.
//

import XCTest
@testable import quality

class qualityUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
        let app = XCUIApplication()
        let userTextField = app.textFields["User"]
        userTextField.tap()
        userTextField.buttons["Clear text"].tap()
        userTextField.typeText("teste")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.buttons["Clear text"].tap()
        passwordSecureTextField.typeText("teste")
        
        let loginButton = app.buttons["login"]
        loginButton.tap()
        
        app.alerts["Wrong Credentials"].collectionViews.buttons["OK"].tap()
        userTextField.tap()
        userTextField.buttons["Clear text"].tap()
        userTextField.typeText("ash")
        
        passwordSecureTextField.tap()
        passwordSecureTextField.buttons["Clear text"].tap()
        passwordSecureTextField.typeText("mistyS2")
        
        loginButton.tap()
        app.tables.cells.elementBoundByIndex(0).tap()
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.tap()
        app.staticTexts["Pikachu"].tap()
        app.navigationBars["quality.DetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
    }
    
    func testExample() {
        XCUIDevice.sharedDevice().orientation =     .Portrait
        
        let app = XCUIApplication()
        app.buttons["login"].tap()
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        app.tables.cells.elementBoundByIndex(0).tap()
        let backButton = app.navigationBars["quality.DetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        backButton.tap()
        app.tables.staticTexts["Fighting"].tap()
        backButton.tap()
        
    }
    
    func mainFlow() {
            print("Blabla")
    }
    
}
