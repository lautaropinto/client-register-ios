//
//  FormView.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import UIKit

internal final class FormView: UIView {
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- Programatical Layout
extension FormView: ProgramaticalLayoutable {
    func buildViewHierarchy() {
        
    }
    
    func setUpConstraints() {
        
    }
    
    func setUpAdditionalConfig() {
        backgroundColor = .red
    }
}
