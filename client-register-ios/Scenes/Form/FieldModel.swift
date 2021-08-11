//
//  FieldModel.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation

internal struct FieldModel {
    let placeHolder: String
    var value: String?
    
    init(placeHolder: String, value: String? = nil) {
        self.placeHolder = placeHolder
        self.value = value
    }
}
