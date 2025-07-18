//
//  MockSignUpModelValidator.swift
//  MVPUnitTestTests
//
//  Created by qbuser on 18/07/25.
//

import Foundation
@testable import MVPUnitTest
class MockSignUpModelValidator : ValidatorProtocol {
   
    
    var isValidFirstName : Bool = false
    var isValidLastName : Bool = false
    var isValidPassword : Bool = false
    var isValidRepeatPassword : Bool = false
    func IsValidFirstName(_ firstName: String) -> Bool {
        isValidFirstName = true
        return isValidFirstName
    }
    func isValidLastNme(lastName: String) -> Bool {
        isValidLastName = true
        return isValidLastName
    }
    func isValidPassword(password: String) -> Bool {
        isValidPassword = true
        return isValidPassword
    }
    func isPasswordMatched(password: String, repeated: String) -> Bool {
        isValidRepeatPassword = true
        return isValidRepeatPassword
    }
    
    
}
