//
//  SignUpVCTest.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasadm on 19/07/25.
//

import XCTest
@testable import MVPUnitTest
final class SignUpVCTest: XCTestCase {
    var storyBoard : UIStoryboard!
    var sut : SignupVC!
    var firstNameTextField : UITextField!
    var lastNameTextField : UITextField!
    var EmailTestField : UITextField!
    var passWordTextField : UITextField!
    var repeatPasswordTextField : UITextField!
    var signUpButton : UIButton!
    var mockSignUpModelValidator : MockSignUpModelValidator!
    var mockSignUpWebService : MockSignUpWebService!
    
    var mockSignUpViewDelegate : MockSignUpViewDelegate!
    override func setUpWithError()  throws {
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "SignupVC") as? SignupVC
        sut?.loadViewIfNeeded()
        firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "Text field not connected")
        lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "Text field not connected")
        EmailTestField = try XCTUnwrap(sut.EmailTestField, "Text field not connected")
        passWordTextField = try XCTUnwrap(sut.passWordTextField, "Text field not connected")
        repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "Text field not connected")
        signUpButton = try XCTUnwrap(sut.signUpButton, "Button not connected")
   
        mockSignUpModelValidator = MockSignUpModelValidator()
        mockSignUpViewDelegate = MockSignUpViewDelegate()
        mockSignUpWebService = MockSignUpWebService()
    }
    
    override func tearDownWithError() throws {
        storyBoard = nil
        sut = nil
        firstNameTextField = nil
        lastNameTextField = nil
        EmailTestField = nil
        passWordTextField = nil
        repeatPasswordTextField = nil
        signUpButton = nil
        mockSignUpModelValidator = nil
        mockSignUpViewDelegate = nil
        mockSignUpWebService = nil
    }
    
    func testSignUpVC_WhenCreated_HasRequiredOutlets() throws{
        XCTAssertEqual(firstNameTextField.text, "", "first name not empty")
        XCTAssertEqual(lastNameTextField.text, "", "last name not empty")
        XCTAssertEqual(EmailTestField.text, "","email not empty")
        XCTAssertEqual(passWordTextField.text, "","password not empty")
        XCTAssertEqual(repeatPasswordTextField.text, "", "repeat password not empty")
    }
    func testSignUpVC_WhenCreated_HasButtonAction() throws {
        let actions = try XCTUnwrap(signUpButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "No action")
        XCTAssertEqual(actions.count, 1)
        XCTAssertTrue(actions.contains("signUp:"), "There is no action")
    }
    func testSignUpVC_WhenINvoked_TriggerSignupAction() throws {
        let mockSignUpPresenter = MockSignUpPresenter(formModelValidator: mockSignUpModelValidator, websService: mockSignUpWebService, delegate: mockSignUpViewDelegate)
        sut.signUpPresenter = mockSignUpPresenter
        sut.signUpButton.sendActions(for:.touchUpInside)

        XCTAssertTrue(mockSignUpPresenter.processUserSignUpCalled, "Method not called")
    }

}
