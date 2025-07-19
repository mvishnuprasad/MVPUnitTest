//
//  MockSignUpViewDelegate.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasad on 19/07/25.
//

import Foundation
import XCTest
@testable import MVPUnitTest
class MockSignUpViewDelegate : SignUpViewDelegateProtocol{
    var succesfulSignUpCounter = 0
    var expectation: XCTestExpectation?
    var errorHandlerCounter = 0
    var signupError : SignUpError?
    func successFulSignUP() {
        succesfulSignUpCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignUpError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
 }
