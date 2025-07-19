//
//  SignUpPresenterTest.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasad on 18/07/25.
//

import XCTest
@testable import MVPUnitTest

final class SignUpPresenterTest: XCTestCase {
    var signupFormModel : SignUpFormModel!
    var mockSignUpModelValidator : MockSignUpModelValidator!
    var mockSignUpWebService : MockSignUpWebService!
    var sut : SignUpPresenter!
    var mockSignUpViewDelegate : MockSignUpViewDelegate!
    
    
    override func setUp () {
        signupFormModel = SignUpFormModel(firstName: "vishnu", lastName: "prasad", email: "vp@vp.com", password: "vp@123", repeatPassword: "vp@123")
        mockSignUpModelValidator = MockSignUpModelValidator()
        mockSignUpViewDelegate = MockSignUpViewDelegate()
        mockSignUpWebService = MockSignUpWebService()
        sut = SignUpPresenter(formModelValidator : mockSignUpModelValidator, websService : mockSignUpWebService, delegate : mockSignUpViewDelegate)
    }
    
    override func tearDown()  {
        signupFormModel = nil
        mockSignUpWebService = nil
        mockSignUpModelValidator = nil
        sut = nil
        mockSignUpViewDelegate = nil
    }
    
    func testSignUpPresenter_WhenINformationProvided_WillValidateEachProperty () {
        sut.processUserSignUp(formModel: signupFormModel)
        XCTAssertTrue(mockSignUpModelValidator.isValidFirstName, "first name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isValidLastName, "last name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isValidPassword, "password was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isValidRepeatPassword, "repeat password was not validated")
    }
    
    func testSignUpPresenter_WhenGivenValidForm_ShouldCallSignUp() {
        sut.processUserSignUp(formModel: signupFormModel)
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled, "Signup method was not called")
    }
    func testSignUpPresenter_WhenSignUpOperationSuccesful_CallSuccessOnView() {
        let myExpectation = expectation(description: "Signup was called")
        
        mockSignUpViewDelegate.expectation = myExpectation
        sut.processUserSignUp(formModel: signupFormModel)
        self.wait(for: [myExpectation],timeout: 5)
        XCTAssertEqual(mockSignUpViewDelegate.succesfulSignUpCounter, 1, "Signup called more than once")
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled, "Signup method was not called")
        
    }
    func testSignUpPresenter_WhenSignUpOperationSuccesful_CallError() {
        let myErrExpectation = expectation(description: "Expected Errorhandler was called")
        
        mockSignUpViewDelegate.expectation = myErrExpectation
        mockSignUpWebService.shouldReturnError = true
        sut.processUserSignUp(formModel: signupFormModel)
        self.wait(for: [myErrExpectation],timeout: 5)
        XCTAssertEqual(mockSignUpViewDelegate.succesfulSignUpCounter, 0)
        XCTAssertEqual(mockSignUpViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignUpViewDelegate.signupError)


    }
}
