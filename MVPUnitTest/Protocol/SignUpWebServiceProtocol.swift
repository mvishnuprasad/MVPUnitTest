//
//  SignUpWebServiceProtocol.swift
//  MVPUnitTest
//
//  Created by vishnuprasad on 19/07/25.
//

import Foundation
protocol SignUpWebServiceProtocol {
    func signUp(withForm SignUpModel:SignUpFormModel , completionHandler:@escaping (SignUpResponseModel?, SignUpError?) -> Void)
}
