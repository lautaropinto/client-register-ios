//
//  NewClient.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation
import FirebaseDatabase

internal protocol ClientAddable {
    var ref: DatabaseReference { get }
    
    func newClient(client: Client)
}

extension ClientAddable {
    func newClient(client: Client) {
        self.ref.child("clients").childByAutoId().setValue([
            "name": client.name,
            "lastname": client.lastname,
            "birthdate": client.birthdate
        ])
    }
}
