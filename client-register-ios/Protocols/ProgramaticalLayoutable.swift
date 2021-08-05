//
//  ProgramaticalLayoutable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 04/08/2021.
//

import Foundation

internal protocol ProgramaticalLayoutable {
    func setUpView()
    func buildViewHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfig()
}

extension ProgramaticalLayoutable {
    func setUpView() {
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfig()
    }
    
    func setUpAdditionalConfig() { }
}
