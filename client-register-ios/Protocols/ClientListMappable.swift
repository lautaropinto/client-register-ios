//
//  ClientListMappable.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation

internal protocol ClientListMappable {
    func mapClientList(from dictionary: [String: [String: String]]) -> [Client]
}

extension ClientListMappable {
    func mapClientList(from dictionary: [String: [String: String]]) -> [Client] {
        var array: [Client] = []
        dictionary.forEach({key, value in
            array.append(Client(from: value))
        })
        
        return array
    }
}
