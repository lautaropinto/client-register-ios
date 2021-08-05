//
//  FormViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

class FormViewController: UIViewController {
    let mainView = FormView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = mainView
    }
}
