//
//  SignUpViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 10/08/2021.
//

import UIKit

class SignUpViewController: UIViewController, SignUpDelegate, SignUpable, ClientListNavigatable {
    let mainView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    func signUpButtonPressed(username: String, password: String) {
        showSpinner(onView: view)
        signUpButtonPressed(username: username, password: password, success: { [weak self] in
            self?.removeSpinner()
            self?.navigateToClientList()
        }, failure: { [weak self] error in
            print("SignUp - error", error) //TODO: implement error handling.
            self?.removeSpinner()
        })
    }
    
    
}
