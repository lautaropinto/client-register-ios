//
//  ClientListViewController.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import UIKit
import FirebaseDatabase

internal final class ClientListViewController: UIViewController, ClientListMappable, Logoutable, FormNavigatable {
    let mainView = ClientListView()
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cerrar sesión", style: .plain, target: self, action: #selector(leftButtonTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Nuevo", style: .plain, target: self, action: #selector(rightButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getClientList()
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    func getClientList() {
        showSpinner(onView: view)
        ref.child("clients").getData { [weak self] (error, snapshot) in
            guard let self = self else {
                return
            }
            
            if let error = error {
                self.removeSpinner()
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                if let dictionary = snapshot.value as? [String: [String: String]] {
                    self.mainView.clients = self.mapClientList(from: dictionary)
                }
                self.removeSpinner()
            }
            else {
                self.removeSpinner()
                print("No data available")
            }
        }
    }
    
    @objc func leftButtonTapped() {
        logout()
    }
    
    @objc func rightButtonTapped() {
        navigateToForm(cleanNavigationStack: false)
    }
}
