//
//  PresenterProtocol.swift
//  MVPUnitTest
//
//  Created by vishnuprasadm on 19/07/25.
//

import Foundation
protocol PresenterProtocol : AnyObject {
    init(formModelValidator: ValidatorProtocol, websService: SignUpWebServiceProtocol,delegate : SignUpViewDelegateProtocol)
    func processUserSignUp(formModel: SignUpFormModel)
}
