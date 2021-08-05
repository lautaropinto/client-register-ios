//
//  FormNavigatable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

internal protocol FormNavigatable {
    var navigationController: UINavigationController { get }
    
    func navigateToForm()
}

extension FormNavigatable {
    func navigateToForm() {
        let form = UIViewController()
        navigationController.pushViewController(form, animated: true)
    }
}
