//
//  SignUpError.swift
//  MVPUnitTest
//
//  Created by vishnuprasadm on 18/07/25.
//

import Foundation
enum SignUpError:LocalizedError,Equatable {
    
    case invalidResponseModel
    case invalidUrlRequestString
    case failedRequest(description:String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(description: let description):
            return description
        case .invalidResponseModel , .invalidUrlRequestString :
            return ""
        }
    }
}
