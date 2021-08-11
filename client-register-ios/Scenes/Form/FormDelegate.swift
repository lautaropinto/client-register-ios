//
//  FormDelegate.swift
//  client-register-ios
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation

internal protocol FormDelegate: AnyObject {
    func newClientButtonPressed(client: Client)
}
