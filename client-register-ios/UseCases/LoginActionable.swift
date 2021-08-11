//
//  LoginActionable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 05/08/2021.
//

import Foundation
import FBSDKLoginKit
import Firebase

/// Implements Login view actions.
internal protocol

LoginDelegate: LoginButtonDelegate {
    /**
     It handles the login action.
     - Parameter `username`: Input in username textfield.
     - Parameter `password`: Input in password textfield.
     */
    func signInButtonPressed(username: String, password: String)
    
    /**
     It handles the sign up action.
     */
    func signUpButtonPressed()
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
        Auth.auth().signIn(withEmail: username, password: password) {authResult, error in
            if let unwrapedError = error {
                failure?(unwrapedError)
                return
            }
            success?()
        }
    }
}

internal protocol Logoutable {
    var navigationController: UINavigationController? { get }
    var loginManager: LoginManager { get }
    var authManager: Auth { get }
    
    func logout()
}

extension Logoutable {
    func logout() {
        do {
            try authManager.signOut()
            loginManager.logOut()
            let login = LoginViewController(authManager: authManager, loginManager: loginManager)
            navigationController?.setViewControllers([login], animated: true)
        } catch {
            print("Unable to signout")
        }
    }
}
