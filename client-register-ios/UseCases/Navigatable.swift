//
//  FormNavigatable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FBSDKLoginKit

internal protocol FormNavigatable {
    var navigationController: UINavigationController? { get }
    
    func navigateToForm(cleanNavigationStack: Bool)
}

extension FormNavigatable {
    func navigateToForm(cleanNavigationStack: Bool) {
        let auth = Auth.auth()
        let login = LoginManager()
        let form = FormViewController(ref: Database.database().reference(),
                                      authManager: auth,
                                      loginManager: login)
        if cleanNavigationStack {
            navigationController?.setViewControllers([form], animated: true)
        } else {
            navigationController?.pushViewController(form, animated: true)
        }
    }
}

internal protocol SignUpNavigatable {
    var navigationController: UINavigationController? { get }
    
    func navigateToSignUp()
}

extension SignUpNavigatable {
    func navigateToSignUp() {
        let signUp = SignUpViewController()
        navigationController?.pushViewController(signUp, animated: true)
    }
}

internal protocol ClientListNavigatable {
    var navigationController: UINavigationController? { get }
    
    func navigateToClientList()
}

extension ClientListNavigatable {
    func navigateToClientList() {
        let auth = Auth.auth()
        let login = LoginManager()
        let clientList = ClientListViewController(ref: Database.database().reference(),
                                                  authManager: auth,
                                                  loginManager: login)
        navigationController?.setViewControllers([clientList], animated: true)
    }
}
