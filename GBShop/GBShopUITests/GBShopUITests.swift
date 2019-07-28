

//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Tatiana Tsygankova on 16/06/2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

import XCTest
import Firebase

class GBShopUITests: XCTestCase {
    
    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
//        setupSnapshot(app)
        
        app = XCUIApplication()
        app.launch()
        scrollViewsQuery = app.scrollViews
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccess() {
        
//        snapshot("LoginScreen")
        enterAuthData(login: "123", password: "123")
        checkAuth(message: "Добрый день!")
    }

    func testFail() {
 //       snapshot("LoginScreen")
        enterAuthData(login: "1", password: "123")
        checkAuth(message: "Неверный логин или пароль")
    }
    
    private func enterAuthData(login: String, password: String) {
        let loginTextField = scrollViewsQuery.textFields["AuthUserName"]
        
        loginTextField.tap()
        loginTextField.typeText(login)
        
        let passwordTextField = scrollViewsQuery.textFields["AuthPassword"]
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        let button = scrollViewsQuery.buttons["Login"]
        button.tap()
    }
    
    private func checkAuth(message: String) {
        let token = addUIInterruptionMonitor(withDescription: message, handler: { alert in
            alert.buttons["Ok"].tap()
            return true
        })
        
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        app.tap()
        removeUIInterruptionMonitor(token)
    }
}
