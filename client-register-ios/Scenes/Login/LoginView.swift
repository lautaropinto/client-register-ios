//
//  LoginView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit
import FBSDKLoginKit

internal final class LoginView: UIView {
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
        
        delegate?.signInButtonPressed(username: username, password: password)
    }
    
    @objc func signUpButtonPressed(_ sender: UIButton) {
        delegate?.signUpButtonPressed()
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
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: 30),
            
            facebookButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            facebookButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            facebookButton.heightAnchor.constraint(equalToConstant: 48),
            facebookButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -30),
            
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            signInButton.heightAnchor.constraint(equalToConstant: 48),
            signInButton.bottomAnchor.constraint(equalTo: facebookButton.topAnchor, constant: -30),
            
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
    
    func setUpAdditionalConfig() {
        backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundPressed(_:)))
        self.addGestureRecognizer(tapGesture)
        
        signInButton.addTarget(self, action: #selector(signInButtonPressed(_:)), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed(_:)), for: .touchUpInside)
        
        facebookButton.permissions = ["public_profile", "email"]
    }
}


// MARK:- UI components
internal func prepareUsernameTextField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Phone, email or username"
    
    return textField
}

internal func preparePasswordTextField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Password"
    textField.isSecureTextEntry = true
    
    return textField
}

private func prepareSignInButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Login", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
}

private func prepareSignUpButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Sign Up", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
}

private func prepareFacebookButton() -> FBLoginButton {
    let button = FBLoginButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
}
