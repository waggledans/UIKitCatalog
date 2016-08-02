//
//  UIKitCatalogUITests.swift
//  UIKitCatalogUITests
//
//  Created by Dan Slov on 8/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import XCTest

class UIKitCatalogUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        
        super.setUp()
        // stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTableView() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tablesQuery = app.tables
        tablesQuery.cells.staticTexts["ActivityIndicatorViewController"].tap()
        app.navigationBars.matchingIdentifier("Activity Indicators").buttons["UIKitCatalog"].tap()
        
    }
    
    func testAlertDialogs() {
        let tablesQuery = app.tables
        tablesQuery.staticTexts["AlertControllerViewController"].tap()
        let cell = tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(1)
        cell.staticTexts["Okay / Cancel"].tap()
        let okButton = app.alerts["A Short Title is Best"].collectionViews.buttons["OK"]
        okButton.tap()
        tablesQuery.staticTexts["Simple"].tap()
        okButton.tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(5).staticTexts["Okay / Cancel"].tap()
        app.sheets.collectionViews.buttons["OK"].tap()
        app.navigationBars.matchingIdentifier("Alert Controllers").buttons["UIKitCatalog"].tap()
    }
    
    func testButtons() {
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Buttons"].tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(0).buttons["Button"].tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(2).childrenMatchingType(.Button).element.tap()
        tablesQuery.buttons["X Button"].tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(4).buttons["Button"].tap()
        app.navigationBars.matchingIdentifier("Buttons").buttons["UIKitCatalog"].tap()
        
    }
    
}
