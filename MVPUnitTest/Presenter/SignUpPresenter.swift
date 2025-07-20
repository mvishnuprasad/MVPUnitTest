//
//  SignUpPresenter.swift
//  MVPUnitTest
//
//  Created by vishnuprasad on 18/07/25.
//

import Foundation
class SignUpPresenter : PresenterProtocol{
    private var formModelValidator : ValidatorProtocol
    private var  websService : SignUpWebServiceProtocol
    private var delegate : SignUpViewDelegateProtocol
    required init(formModelValidator: ValidatorProtocol, websService: SignUpWebServiceProtocol,delegate : SignUpViewDelegateProtocol){
        self.formModelValidator = formModelValidator
        self.websService = websService
        self.delegate = delegate
    }
    func processUserSignUp(formModel: SignUpFormModel){
        if !formModelValidator.IsValidFirstName(formModel.firstName){
            delegate.errorHandler(error:SignUpError.invalidUrlRequestString)
            return
        }else{
            delegate.successFulSignUP()
        }
        if !formModelValidator.isValidLastNme(lastName: formModel.lastName){
            return
        }
        if !formModelValidator.isValidPassword(password: formModel.password){
            delegate.errorHandler(error:SignUpError.invalidUrlRequestString)

            return
        }
        else{
            delegate.successFulSignUP()
        }
        if !formModelValidator.isPasswordMatched(password: formModel.password, repeated: formModel.repeatPassword){
            return
        }
        let requestModel = SignUpFormModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password, repeatPassword: formModel.repeatPassword)
        websService.signUp(withForm: requestModel) { response, error in
            if let _ = response {
                self.delegate.successFulSignUP()
                return
            }
            if let err = error {
                self.delegate.errorHandler(error: err )
                return
            }
        }
    }
}
