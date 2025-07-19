//
//  SignUpViewDelegate.swift
//  MVPUnitTest
//
//  Created by vishnuprasad on 19/07/25.
//

import Foundation
protocol SignUpViewDelegateProtocol : AnyObject {
    func successFulSignUP()
    func errorHandler(error: SignUpError)
}
