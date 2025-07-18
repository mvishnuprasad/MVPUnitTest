//
//  ValidatorProtocol.swift
//  MVPUnitTest
//
//  Created by qbuser on 18/07/25.
//

import Foundation
protocol ValidatorProtocol {
    
    func IsValidFirstName (_ firstName:String)-> Bool
    func isValidPassword(password:String)-> Bool
    func isValidLastNme(lastName: String)  -> Bool
    func isPasswordMatched(password:String,repeated:String) -> Bool
}
