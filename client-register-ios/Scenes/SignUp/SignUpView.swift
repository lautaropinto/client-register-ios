//
//  SignUpView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 10/08/2021.
//

import UIKit
import Firebase

internal final class SignUpView: UIView {
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
        
        delegate?.signUpButtonPressed(username: username, password: password)
    }
    
    @objc func backgroundPressed(_ sender: UIView) {
        subviews.forEach{ $0.resignFirstResponder() }
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
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 30),
            
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            signUpButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func setUpAdditionalConfig() {
        backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundPressed(_:)))
        self.addGestureRecognizer(tapGesture)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed(_:)), for: .touchUpInside)
    }
}

private func prepareSignUpButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Crear cuenta", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
}
