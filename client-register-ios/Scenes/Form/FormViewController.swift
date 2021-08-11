//
//  FormViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit
import FirebaseDatabase
import Firebase

internal final class FormViewController: UIViewController, Logoutable, FormDelegate, ClientAddable {
    let mainView = FormView()
    var ref: DatabaseReference

    init(ref: DatabaseReference) {
        self.ref = ref
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cerrar sesión", style: .plain, target: self, action: #selector(rightButtonTapped))
        mainView.delegate = self
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    @objc func rightButtonTapped() {
        logout()
    }
    
    func newClientButtonPressed(client: Client) {
        newClient(client: client)
        navigationController?.popViewController(animated: true)
    }
}
