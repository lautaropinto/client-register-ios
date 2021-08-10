//
//  FormViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

internal final class FormViewController: UIViewController, Logoutable {
    let mainView = FormView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(rightButtonTapped))

    }
    
    override func loadView() {
        self.view = mainView
    }
    
    @objc func rightButtonTapped() {
        logout()
    }
}
