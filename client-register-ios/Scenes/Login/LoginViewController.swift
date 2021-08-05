//
//  LoginViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

internal final class LoginViewController: UIViewController, LoginActionable {
    let mainView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
    
    override func loadView() {
        self.view = mainView
    }
}
