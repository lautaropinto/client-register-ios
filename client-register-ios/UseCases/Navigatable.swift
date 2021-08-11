//
//  FormNavigatable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit
import FirebaseDatabase

internal protocol FormNavigatable {
    var navigationController: UINavigationController? { get }
    
    func navigateToForm(cleanNavigationStack: Bool)
}

extension FormNavigatable {
    func navigateToForm(cleanNavigationStack: Bool) {
        let form = FormViewController(ref: Database.database().reference())
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

extension FormNavigatable {
    func navigateToSignUp() {
        let signUp = SignUpViewController()
        navigationController?.pushViewController(signUp, animated: true)
    }
}
