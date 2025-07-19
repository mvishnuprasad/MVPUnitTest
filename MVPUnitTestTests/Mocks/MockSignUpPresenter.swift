//
//  MockSignUpPresenter.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasadm on 19/07/25.
//

import Foundation
@testable import MVPUnitTest
class MockSignUpPresenter : PresenterProtocol{
    var processUserSignUpCalled : Bool = false

    required init(formModelValidator: ValidatorProtocol, websService:  SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol) {
         
    }
    
    func processUserSignUp(formModel: SignUpFormModel) {
        processUserSignUpCalled = true
    }
    
}
