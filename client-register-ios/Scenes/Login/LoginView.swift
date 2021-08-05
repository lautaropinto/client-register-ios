//
//  LoginView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

internal final class LoginView: UIView {
    let usernameTextField = prepareUsernameTextField()
    let passwordTextField = preparePasswordTextField()
    let signInButton = prepareSignInButton()
    let facebookButton = prepareFacebookButton() // TODO:- IMPLEMENTAR.
    public weak var delegate: LoginDelegate?
    
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
}

// MARK:- Programatical Layout
extension LoginView: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(facebookButton)
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
            facebookButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            signInButton.heightAnchor.constraint(equalToConstant: 48),
            signInButton.bottomAnchor.constraint(equalTo: facebookButton.topAnchor, constant: -30),
        ])
    }
    
    func setUpAdditionalConfig() {
        backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundPressed(_:)))
        self.addGestureRecognizer(tapGesture)
        
        signInButton.addTarget(self, action: #selector(signInButtonPressed(_:)), for: .touchUpInside)
    }
}


// MARK:- UI components
private func prepareUsernameTextField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Phone, email or username"
    
    return textField
}

private func preparePasswordTextField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = "Password"
    textField.isSecureTextEntry = true
    
    return textField
}

private func prepareSignInButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Sign in", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
}

private func prepareFacebookButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Facebook sign in", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
}
