//
//  SignUpPresenterTest.swift
//  MVPUnitTestTests
//
//  Created by qbuser on 18/07/25.
//

import XCTest
@testable import MVPUnitTest

final class SignUpPresenterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpPresenter_WhenINformationProvided_WillValidateEachProperty () {
        let signupFormModel = SignUpFormModel(firstName: "vishnu", lastName: "prasad", email: "vp@vp.com", password: "vp@123", repeatPassword: "vp@123")
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let sut = SignUpPresenter(formModelValidator : mockSignUpModelValidator)
        sut.processUserSignUp(formModel: signupFormModel)
        XCTAssertTrue(mockSignUpModelValidator.isValidFirstName)
        XCTAssertTrue(mockSignUpModelValidator.isValidLastName)
        XCTAssertTrue(mockSignUpModelValidator.isValidPassword)
        XCTAssertTrue(mockSignUpModelValidator.isValidRepeatPassword)
    }

}
