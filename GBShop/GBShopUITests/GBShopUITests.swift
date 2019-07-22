

//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Tatiana Tsygankova on 16/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import XCTest

class GBShopUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.children(matching: .textField).element.tap()
        
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        key2.tap()
        key2.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        key3.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        let secureTextField = scrollViewsQuery.children(matching: .secureTextField).element
        secureTextField.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        moreKey.tap()
        key.tap()
        key.tap()
        key2.tap()
        key2.tap()
        deleteKey.tap()
        deleteKey.tap()
        key3.tap()
        key3.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        let loginButton = app/*@START_MENU_TOKEN@*/.buttons["Login"]/*[[".scrollViews.buttons[\"Login\"]",".buttons[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        loginButton.tap()
        
        let productsCatalogNavigationBar = app.navigationBars["Products Catalog"]
        productsCatalogNavigationBar.buttons["Products Catalog"].tap()
        productsCatalogNavigationBar.buttons["Back"].tap()
        secureTextField.tap()
        
        let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()
        dKey.tap()
        loginButton.tap()
        app.alerts["Error"].buttons["OK"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["SignUp"]/*[[".scrollViews.buttons[\"SignUp\"]",".buttons[\"SignUp\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
