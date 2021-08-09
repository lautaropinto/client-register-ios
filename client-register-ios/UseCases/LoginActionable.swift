//
//  LoginActionable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 05/08/2021.
//

import Foundation
import FBSDKLoginKit

/// Implements Login view actions.
internal protocol LoginDelegate: LoginButtonDelegate {
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
    func signIn(username: String, password: String, success: (() ->())?, failure: ((Error) ->())?)
}

internal protocol FirebaseSignInActionable: SignInActionable {}

extension FirebaseSignInActionable {
    func signIn(username: String, password: String, success: (() ->())?, failure: ((Error) ->())?) {
        success?()
        //TODO: implement firebase sign in.
    }
}
