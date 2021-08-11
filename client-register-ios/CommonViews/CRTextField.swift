//
//  CRTextField.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import UIKit

class CRTextField: UITextField {
    let errorMessage = prepareLabel()
    
    init() {
        super.init(frame: .zero)
        self.textAlignment = .left
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        addSubview(errorMessage)
        
        NSLayoutConstraint.activate([
            errorMessage.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 25),
        ])
    }
    
    func showError(with message: String) {
        errorMessage.text = message
        errorMessage.isHidden = false
        self.shake()
    }
    
    func hideError() {
        errorMessage.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

private func prepareLabel() -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "error"
    label.textColor = .CR.red
    label.isHidden = true
    
    return label
}
