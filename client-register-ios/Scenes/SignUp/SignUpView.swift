//
//  SignUpView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 10/08/2021.
//

import UIKit
import Firebase

internal final class SignUpView: UIView, UITextFieldDelegate {
    let emailTextField = prepareUsernameTextField()
    let passwordTextField = preparePasswordTextField()
    let signUpButton = prepareSignUpButton()
    
    internal weak var delegate: SignUpDelegate?
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func signUpButtonPressed(_ sender: UIButton) {
        guard let username = emailTextField.text,
              let password = passwordTextField.text else {
            return //TODO: implement error handling.
        }
        
        if username == "" && password == "" {
            emailTextField.shake()
            passwordTextField.shake()
            passwordTextField.showError(with: "Por favor ingrese email y contraseña")
            return
        }
        
        if username == "" {
            emailTextField.shake()
            passwordTextField.showError(with: "El email es obligatorio")
            return
        }
        
        if password == "" {
            passwordTextField.shake()
            passwordTextField.showError(with: "La contraseña es obligatoria")
            return
        }
        
        delegate?.signUpButtonPressed(username: username, password: password)
    }
    
    @objc func backgroundPressed(_ sender: UIView) {
        subviews.forEach{ $0.resignFirstResponder() }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let crTextField = textField as? CRTextField {
            crTextField.hideError()
        }
        //TODO: add validation
        return true
    }
}

extension SignUpView: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        [emailTextField,
        passwordTextField,
        signUpButton].forEach { addSubview($0) }
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 50),
            
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            signUpButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func setUpAdditionalConfig() {
        backgroundColor = .CR.white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundPressed(_:)))
        self.addGestureRecognizer(tapGesture)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed(_:)), for: .touchUpInside)
        
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
}

private func prepareSignUpButton() -> CRButton {
    let button = CRButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Crear cuenta", for: .normal)
    
    return button
}
