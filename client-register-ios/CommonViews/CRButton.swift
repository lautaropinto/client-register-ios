//
//  CRButton.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import UIKit

class CRButton: UIButton {
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .CR.purple02
        self.layer.cornerRadius = 10
        self.setTitleColor(.CR.white, for: .normal)
        self.applyShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
