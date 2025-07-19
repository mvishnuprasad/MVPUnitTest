//
//  SignUpFormModel.swift
//  MVPUnitTest
//
//  Created by vishnuprasad on 18/07/25.
//

import Foundation
struct SignUpFormModel : Codable {
    let firstName : String
    let lastName : String
    let email :String
    let password: String
    let repeatPassword: String
}
