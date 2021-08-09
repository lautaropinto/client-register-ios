//
//  LoginViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit
import FBSDKLoginKit
import Firebase

internal final class LoginViewController: UIViewController, LoginDelegate, FirebaseSignInActionable, FormNavigatable {
    let mainView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    func signInButtonPressed(username: String, password: String) {
        signIn(username: username, password: password, success: { [weak self] in
            self?.navigateToForm()
        }, failure: { _ in
            print("Error")
        })
    }
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            return
        }
        
        let credential = FacebookAuthProvider
            .credential(withAccessToken: AccessToken.current!.tokenString)
        
        Auth.auth().signIn(with: credential, completion: { [weak self] authResult, error in
            if let error = error {
                let authError = error as NSError
                print("Auth error:", authError)
                return
            }
            self?.navigateToForm()
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
}
