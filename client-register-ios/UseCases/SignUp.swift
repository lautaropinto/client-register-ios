//
//  SignUp.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation
import FirebaseAuth

internal protocol SignUpable {
    func signUpButtonPressed(username: String, password: String, success: (() ->())?, failure: ((Error) ->())?)
}

extension SignUpable {
    func signUpButtonPressed(username: String, password: String, success: (() ->())?, failure: ((Error) ->())?) {
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            if let unwrapedError = error {
                failure?(unwrapedError)
                return
            }
            success?()
        }
    }
}
