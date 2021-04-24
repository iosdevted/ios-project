//
//  SignupFormRequestModel.swift
//  unit-test
//
//  Created by Ted on 2021/04/19.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
