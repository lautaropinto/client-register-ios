//
//  UIView+applyShadow.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import UIKit

internal extension UIView {
    func applyShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 50
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
    }
}
