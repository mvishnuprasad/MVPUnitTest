//
//  SignUpPresenter.swift
//  MVPUnitTest
//
//  Created by qbuser on 18/07/25.
//

import Foundation
class SignUpPresenter {
    private var formModelValidator : ValidatorProtocol
    init(formModelValidator: ValidatorProtocol){
        self.formModelValidator = formModelValidator
    }
    func processUserSignUp(formModel: SignUpFormModel){
        if !formModelValidator.IsValidFirstName(formModel.firstName){
            return 
        }
        if !formModelValidator.isValidLastNme(lastName: formModel.lastName){
            return
        }
        if !formModelValidator.isValidPassword(password: formModel.password){
            return
        }
        if !formModelValidator.isPasswordMatched(password: formModel.password, repeated: formModel.repeatPassword){
            return
        }
    }
}
