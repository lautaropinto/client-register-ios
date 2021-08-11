//
//  LoginView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit
import FBSDKLoginKit

internal final class LoginView: UIView, UITextFieldDelegate {
    let usernameTextField = prepareUsernameTextField()
    let passwordTextField = preparePasswordTextField()
    let signInButton = prepareSignInButton()
    let facebookButton: FBLoginButton = prepareFacebookButton()
    let signUpButton = prepareSignUpButton() //TODO: Replace with attributed string
    
    internal weak var delegate: LoginDelegate? {
        didSet {
            facebookButton.delegate = delegate
        }
    }
    
    init(delegate: LoginDelegate? = nil) {
        super.init(frame: .zero)
        self.delegate = delegate
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backgroundPressed(_ sender: UIView) {
        subviews.forEach{ $0.resignFirstResponder() }
    }
    
    @objc func signInButtonPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else {
            return //TODO: implement error handling.
        }
        
        if username == "" && password == "" {
            usernameTextField.shake()
            passwordTextField.shake()
            passwordTextField.showError(with: "Por favor ingrese email y contraseña")
            return
        }
        
        if username == "" {
            usernameTextField.shake()
            passwordTextField.showError(with: "El email es obligatorio")
            return
        }
        
        if password == "" {
            passwordTextField.shake()
            passwordTextField.showError(with: "La contraseña es obligatoria")
            return
        }
        
        delegate?.signInButtonPressed(username: username, password: password)
    }
    
    @objc func signUpButtonPressed(_ sender: UIButton) {
        delegate?.signUpButtonPressed()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let crTextField = textField as? CRTextField {
            crTextField.hideError()
        }
        //TODO: add validation
        return true
    }
}

// MARK:- Programatical Layout
extension LoginView: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        [usernameTextField,
         passwordTextField,
         signInButton,
         facebookButton,
         signUpButton].forEach {addSubview($0)}
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            usernameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: 50),
            
            facebookButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            facebookButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            facebookButton.heightAnchor.constraint(equalToConstant: 48),
            facebookButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -20),
            
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            signInButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor),
            signInButton.bottomAnchor.constraint(equalTo: facebookButton.topAnchor, constant: -20),
            
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
    
    func setUpAdditionalConfig() {
        backgroundColor = .CR.white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundPressed(_:)))
        self.addGestureRecognizer(tapGesture)
        
        signInButton.addTarget(self, action: #selector(signInButtonPressed(_:)), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed(_:)), for: .touchUpInside)
        
        facebookButton.permissions = ["public_profile", "email"]
        
        passwordTextField.delegate = self
        usernameTextField.delegate = self
    }
}


// MARK:- UI components
internal func prepareUsernameTextField() -> CRTextField {
    let textField = CRTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Email"
    textField.applyShadow()
    
    return textField
}

internal func preparePasswordTextField() -> CRTextField {
    let textField = CRTextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Password"
    textField.isSecureTextEntry = true
    textField.applyShadow()
    
    return textField
}

private func prepareSignInButton() -> CRButton {
    let button = CRButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Iniciar sesión", for: .normal)
    
    return button
}

private func prepareSignUpButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Crear cuenta", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
}

private func prepareFacebookButton() -> FBLoginButton {
    let button = FBLoginButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
}
