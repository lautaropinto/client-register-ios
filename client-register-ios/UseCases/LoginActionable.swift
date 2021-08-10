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

internal protocol Logoutable {
    var navigationController: UINavigationController? { get }
    
    func logout()
}

extension Logoutable {
    func logout() {
        do {
            try Auth.auth().signOut()
            LoginManager().logOut()
            let login = LoginViewController()
            navigationController?.setViewControllers([login], animated: true)
        } catch {
            print("Unable to signout")
        }
    }
}
