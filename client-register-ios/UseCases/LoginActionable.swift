//
//  LoginActionable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 05/08/2021.
//

import Foundation

/// Implements Login view actions.
internal protocol LoginDelegate: AnyObject {
    /**
     It handles the view action.
     - Parameter `username`: Input in username textfield.
     - Parameter `password`: Input in password textfield.
     */
    func signInButtonPressed(username: String, password: String)
}

/// Implements SignIn functionality.
internal protocol SignInActionable {
    /**
     It tries to sign in a user
     - Parameter `username`: A `String` input by the user.
     - Parameter `password`: A `String` input by the user.
     - Parameter `success`: An Void closure that handles the success sign in.
     */
    func signIn(username: String, password: String, success: (() ->())?)
}

internal protocol FirebaseSignInActionable: SignInActionable {}

extension FirebaseSignInActionable {
    func signIn(username: String, password: String, success: (() ->())?) {
        success?()
        //TODO: implement firebase sign in.
    }
}
