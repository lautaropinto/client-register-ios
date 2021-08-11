//
//  Client.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation

internal struct Client {
    let name: String
    let lastname: String
    let birthdate: String
    //let age: String
    
    init(from field: [String: FieldModel]) {
        self.name = field["name"]?.value ?? ""
        self.lastname = field["lastname"]?.value ?? ""
        self.birthdate = field["birthdate"]?.value ?? ""
    }
    
    init(from dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.lastname = dictionary["lastname"] as? String ?? ""
        self.birthdate = dictionary["birthdate"] as? String ?? ""
    }
}
