//
//  MockSignUpWebService.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasad on 19/07/25.
//

import Foundation
@testable import MVPUnitTest
class MockSignUpWebService : SignUpWebServiceProtocol{
  
    
    var isSignUpMethodCalled : Bool = false
    var shouldReturnError : Bool = false
    func signUp(withForm SignUpModel: SignUpFormModel, completionHandler: @escaping (MVPUnitTest.SignUpResponseModel?, MVPUnitTest.SignUpError?) -> Void) {
        isSignUpMethodCalled = true
        if shouldReturnError {
            let err = SignUpError.failedRequest(description: "Error , req not success")
            completionHandler(nil, err)
        }else{
            let res = SignUpResponseModel(status: "ok")
            completionHandler(res, nil)
        }
    }
    
}
