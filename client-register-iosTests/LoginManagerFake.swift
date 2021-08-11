//
//  LoginManagerFake.swift
//  client-register-iosTests
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import Foundation
import FBSDKLoginKit

internal class LoginManagerFake: LoginManager {
    var didLogout = false
    
    override init() {
        
    }
    
    override func logOut() {
        didLogout = true
    }
}
