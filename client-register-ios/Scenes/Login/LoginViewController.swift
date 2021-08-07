//
//  LoginViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

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
        })
    }
}
