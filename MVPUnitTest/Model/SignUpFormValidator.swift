//
//  SignUpFormValidator.swift
//  MVPUnitTest
//
//  Created by vishnuprasadm on 18/07/25.
//

import Foundation

class SignUpFormValidator :ValidatorProtocol {
    
    
    func IsValidFirstName (_ firstName:String)-> Bool {
        var isValid = true
        
        if firstName.count <= SignUpConstants.firstNameMinLength || firstName.count > SignUpConstants.firstNameMaxLength{
            isValid = false
        }
        return isValid
    }
    
    func isValidPassword(password:String)-> Bool {
        var isValid = true
        
        if password.count < SignUpConstants.minPasswordLength {
            isValid = false
        }
        return isValid
    }
    
    
    func isValidLastNme(lastName: String)  -> Bool {
        var isValid = true
        
        if lastName.count <=  SignUpConstants.firstNameMinLength || lastName.count > SignUpConstants.lastNameMaxLength {
            isValid =  false
        }
        
        return isValid
    }
    
    func isPasswordMatched(password:String,repeated:String) -> Bool {
        return password == repeated
    }
}
