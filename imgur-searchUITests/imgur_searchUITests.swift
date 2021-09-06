//
//  imgur_searchUITests.swift
//  imgur-searchUITests
//
//  Created by Bruno Vieira on 05/09/21.
//

import XCTest

class imgur_searchUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testAppTitleOnScreen() throws {
        let appTitle = app.staticTexts["Imgur Search"]
        
        XCTAssert(appTitle.exists)
    }

    func testInitialMessageOnScreen() throws {
        let searchForSomethingMsg = app.staticTexts["Search for something awesome!"]
        
        XCTAssert(searchForSomethingMsg.exists)
    }
    
    func testHiddenButtonGoOnScreen() throws {
        let buttonGO = app.buttons["GO"]
        
        XCTAssert(!buttonGO.exists)
    }

    func testSearchTextFieldOnScreen() throws {
        let searchTextField = app.textFields["Search..."]
        
        XCTAssert(searchTextField.exists)
    }
    
    func testButtonGOIsVisibleWhenSearching() throws {
        let searchTextField = app.textFields["Search..."]
        let buttonGO = app.buttons["GO"]
        
        searchTextField.tap()
        searchTextField.typeText("stub")
        
        XCTAssert(buttonGO.exists)
    }
}
