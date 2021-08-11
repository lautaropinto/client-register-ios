//
//  SignUpDelegate.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation

internal protocol SignUpDelegate: AnyObject {
    /**
     It handles the sign up action.
     - Parameter `username`: Input in username textfield.
     - Parameter `password`: Input in password textfield.
     */
    func signUpButtonPressed(username: String, password: String)
}
