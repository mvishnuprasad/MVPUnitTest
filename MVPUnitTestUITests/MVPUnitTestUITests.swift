//
//  MVPUnitTestUITests.swift
//  MVPUnitTestUITests
//
//  Created by vishnuprasadm on 18/07/25.
//

import XCTest

final class MVPUnitTestUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor
    func testSignupVC_WhenViewIsLoaded_RequiredElementsareEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let firstName = app.textFields["First Name"]
        let pwd = app.secureTextFields["Password"]
        let button = app.buttons["SignUp"]
        XCTAssertTrue(firstName.isEnabled, "Not Enabled")
        XCTAssertTrue(pwd.isEnabled, "Not Enabled")
        XCTAssertTrue(button.isEnabled, "Not Enabled")
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testVC_WhenInvalidFormSubmittedPresentAlert() {
        let app = XCUIApplication()
        app.launch()
        let firstName = app.textFields["First Name"]
        firstName.tap()
        firstName.typeText("v")
        let pwd = app.secureTextFields["Password"]
        pwd.tap()
        pwd.typeText("v")
        let button = app.buttons["SignUp"]
        button.tap()
        XCTAssertTrue(app.alerts["errorDialog"].exists)
    }
    func testVC_WhenValidFormSubmittedPresentAlert() {
        let app = XCUIApplication()
        app.launch()
        let firstName = app.textFields["First Name"]
        firstName.tap()
        firstName.typeText("vishnu")
        let pwd = app.secureTextFields["Password"]
        pwd.tap()
        pwd.typeText("Abc@12dfv")
        let button = app.buttons["SignUp"]
        button.tap()
        XCTAssertTrue(app.alerts["successDialog"].exists)
    }
    func testVC_DidVCShowUp_WhenTapped() {
        let app = XCUIApplication()
        app.launch()
        let button = app.buttons["termsButton"]
        button.tap()
        XCTAssertTrue(app.otherElements["TermsVC"].waitForExistence(timeout: 1))
    }
    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
