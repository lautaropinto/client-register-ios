//
//  LoginViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit
import FBSDKLoginKit
import Firebase

internal final class LoginViewController: UIViewController, LoginDelegate,
                                          FirebaseSignInActionable, FormNavigatable,
                                          Logoutable, SignUpNavigatable {
    let mainView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    func signInButtonPressed(username: String, password: String) {
        showSpinner(onView: view)
        signIn(username: username, password: password, success: { [weak self] in
            self?.navigateToForm(cleanNavigationStack: true)
            self?.removeSpinner()
        }, failure: { [weak self] error in
            print("Login error", error)
            self?.removeSpinner()
        })
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        showSpinner(onView: view)
        if error != nil {
            removeSpinner()
            return
        }
        
        let credential = FacebookAuthProvider
            .credential(withAccessToken: AccessToken.current!.tokenString)
        
        Auth.auth().signIn(with: credential, completion: { [weak self] authResult, error in
            if let error = error {
                let authError = error as NSError
                print("Auth error:", authError)
                self?.removeSpinner()
                return
            }
            self?.removeSpinner()
            self?.navigateToForm(cleanNavigationStack: true)
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        logout()
    }
    
    func signUpButtonPressed() {
        navigateToSignUp()
    }
}
