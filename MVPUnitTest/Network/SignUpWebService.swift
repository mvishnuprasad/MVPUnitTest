//
//  SignUpWebService.swift
//  MVPUnitTest
//
//  Created by vishnuprasadm on 18/07/25.
//


import Foundation
import UIKit

class SignUpWebService : SignUpWebServiceProtocol{
    
    private var urlSession:URLSession
    private var urlString:String
    
    init(urlString: String,urlSession:URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp(withForm SignUpModel:SignUpFormModel , completionHandler:@escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil,SignUpError.invalidUrlRequestString)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody  = try? JSONEncoder().encode(SignUpModel)
        
        let dataTask =  urlSession.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                return completionHandler(nil,SignUpError.failedRequest(description: error.localizedDescription))
            }
            if let data = data , let responseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data){
                
                return completionHandler(responseModel, nil)
            }else {
                completionHandler(nil,SignUpError.invalidResponseModel)
            }
        }
        dataTask.resume()
    }
}
