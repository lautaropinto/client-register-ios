//
//  FormNavigatable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

internal protocol FormNavigatable {
    var navigationController: UINavigationController? { get }
    
    func navigateToForm(cleanNavigationStack: Bool)
}

extension FormNavigatable {
    func navigateToForm(cleanNavigationStack: Bool) {
        let form = FormViewController()
        if cleanNavigationStack {
            navigationController?.setViewControllers([form], animated: true)
        } else {
            navigationController?.pushViewController(form, animated: true)
        }
    }
}
