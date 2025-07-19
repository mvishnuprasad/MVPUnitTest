//
//  SignupWebServiceTests.swift
//  MVPUnitTestTests
//
//  Created by vishnuprasadm on 18/07/25.
//

import Foundation

import XCTest
@testable import MVPUnitTest
final class SignUpWebServiceTests: XCTestCase {
    
    var sut:SignUpWebService!
    var signUpFormRequestModel:SignUpFormModel!
    
    override func setUp() {
        /// Setting up mock url protocol for usage
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockUrlProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignUpWebService(urlString:SignUpConstants.signUpUrlString ,urlSession: urlSession)
        
        signUpFormRequestModel = SignUpFormModel(firstName:"vishnu",lastName:"prasad",email:"vpm@vpm.com",password:"123456",repeatPassword: "123456")
    }
    
    override func tearDown() {
        sut = nil
        signUpFormRequestModel = nil
        MockUrlProtocol.stubResponseData = nil
    }
    
    func testSignUpWebService_WhenGivenSuccesfullyResponse_ShouldReturnSuccess(){
        
        let jsonString = "{\"status\":\"ok\"}"
        MockUrlProtocol.stubResponseData =  jsonString.data(using: .utf8)
        let expectaion = self.expectation(description: "SignUp Web Service Response Expectasion .")
        
        sut.signUp(withForm:signUpFormRequestModel) { (SignUpResponseModel , error) in
            XCTAssertEqual(SignUpResponseModel?.status, "ok")
            expectaion.fulfill()
            
        }
        
        self.wait(for: [expectaion], timeout: 5)
    }
    
    
    func testSignUpWebService_WhenRecieveDifferentJsonResponse_ShouldBeGotError(){
        
        
        let jsonString = "{\"alert\":\"differenet result\"}"
        MockUrlProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        let expectaion =  self.expectation(description: "SignUp() method expectation is got different Json Response")
        
        
        sut.signUp(withForm:signUpFormRequestModel) { (SignUpResponseModel , error) in
            
            
            XCTAssertNil(SignUpResponseModel , "SignUp() must send Response as nil when i got Different Json Response but i got a value")
            XCTAssertEqual(error, SignUpError.invalidResponseModel , "the signUp() method did not return expcted error")
            expectaion.fulfill()
        }
        
        self.wait(for: [expectaion], timeout: 5)
        
    }
    
    
    func testSignUpWebService_WhenEmptyRequestUrlProvided_ShouldReturnError(){
        
        sut = SignUpWebService(urlString: "")
        let expectaion  = self.expectation(description: "An Empty Url Request Expectaion")
        
        
        sut.signUp(withForm: signUpFormRequestModel) { signUpResponse, error in
            
            
            XCTAssertEqual(error, SignUpError.invalidUrlRequestString," expect from SignUp() return error invalid url but she don't and return a different one")
            XCTAssertNil(signUpResponse,"expext from SignUp() to get nil response but i got a result")
            expectaion.fulfill()
        }
        
        self.wait(for: [expectaion], timeout: 2)
    }
    
    
    func testSignUpWebService_WhenRequestFail_shouldReturnErrorMessageDescription(){
        
        
        let expectation = self.expectation(description: "excpect return localized error message because reauest is failed")
        let errorDescription = "Localized Description Of An Error"
        MockUrlProtocol.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])
        
        
        sut.signUp(withForm: signUpFormRequestModel) { responseModel, error in
            
            XCTAssertEqual(error, SignUpError.failedRequest(description:errorDescription),"excpect from SignUp() return failedRequest error message because request is failed but it return different error")
            expectation.fulfill()
        }
        
        
        self.wait(for: [expectation], timeout: 2)
        
    }
    
}
