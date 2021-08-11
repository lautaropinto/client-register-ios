//
//  ClientListViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FBSDKLoginKit

internal final class ClientListViewController: UIViewController, ClientListMappable, Logoutable, FormNavigatable {
    let mainView = ClientListView()
    var ref: DatabaseReference
    let authManager: Auth
    let loginManager: LoginManager
    
    
    init(ref: DatabaseReference, authManager: Auth, loginManager: LoginManager) {
        self.ref = ref
        self.authManager = authManager
        self.loginManager = loginManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cerrar sesión", style: .plain, target: self, action: #selector(leftButtonTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Nuevo", style: .plain, target: self, action: #selector(rightButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeSpinner()
        showSpinner(onView: view)
        getClientList()
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    func getClientList() {
        ref.child("clients").getData { [weak self] (error, snapshot) in
            guard let self = self else {
                self!.removeSpinner()
                return
            }
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                if let dictionary = snapshot.value as? [String: [String: String]] {
                    self.mainView.clients = self.mapClientList(from: dictionary)
                }
            }
            else {
                print("No data available")
            }
            self.removeSpinner()
        }
    }
    
    @objc func leftButtonTapped() {
        logout()
    }
    
    @objc func rightButtonTapped() {
        navigateToForm(cleanNavigationStack: false)
    }
}
