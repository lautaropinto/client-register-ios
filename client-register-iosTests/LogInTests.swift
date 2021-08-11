//
//  LogInTests.swift
//  client-register-iosTests
//
//  Created by Lautaro Pinto on 11/08/2021.
//

import XCTest
@testable import client_register_ios
@testable import Firebase
import FBSDKLoginKit

internal class LogInTests: XCTestCase {
    var sut: LoginViewController!
    var authManager: Auth!
    var loginManager: LoginManagerFake!
    
    override func setUpWithError() throws {
        let auth = Auth.auth()
        authManager = auth
        loginManager = LoginManagerFake()
        sut = LoginViewController(authManager: authManager, loginManager: loginManager)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLogoutSuccesfull() throws {
        sut.logout()
        
        XCTAssert(loginManager.didLogout)
    }
    
    func testFacebookLogoutSuccesfull() throws {
        sut.loginButtonDidLogOut(FBLoginButton())
        
        XCTAssert(loginManager.didLogout)
    }
}

//Unable to mock due to unaccesibility. TODO: build wrapper to mock Auth.
internal class AuthManagerFake: Auth {
    var signOutSuccesfully = false
    var didLogout = false

    
    override func signOut() throws {
        if signOutSuccesfully {
            didLogout = true
        } else {
            throw AuthManagerError.unableToSignOut
        }
    }
}

private enum AuthManagerError: Error {
    case unableToSignOut
}
