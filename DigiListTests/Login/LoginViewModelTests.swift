//
//  LoginViewModelTests.swift
//  DigiListTests
//
//  Created by Cruz Fernández Diego on 9/8/23.
//

import XCTest
@testable import DigiList

final class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testLoginViewModel_whenLoginWithCorrectCredentials_expectCompletionFalse() throws {
        //The logic of the completion is inverted since if the boolean is true it means that the verification has failed
        
        let user = "dzz"
        let password = "keep"
        var boolCompletion: Bool = true
        
        sut?.login(user: user, password: password){ boolean in
            boolCompletion = boolean
        }
        XCTAssertEqual(boolCompletion, false)
    }
    
    func testLoginViewModel_whenLoginWithUserNil_expectCompletionTrue() throws {
        let user: String? = nil
        let password = "keep"
        var boolCompletion: Bool = false
        
        sut?.login(user: user, password: password){ boolean in
            boolCompletion = boolean
        }
        XCTAssertEqual(boolCompletion, true)
    }
    
    func testLoginViewModel_whenLoginWithPasswordNil_expectCompletionTrue() throws {
        let user = "dzz"
        let password: String? = nil
        var boolCompletion: Bool = false
        
        sut?.login(user: user, password: password){ boolean in
            boolCompletion = boolean
        }
        XCTAssertEqual(boolCompletion, true)
    }
    
    func testLoginViewModel_whenLoginCredentialsAreIncorrect_expectCompletionTrue() throws {
        let user = "ddd"
        let password = "fdf"
        var boolCompletion: Bool = false
        
        sut?.login(user: user, password: password){ boolean in
            boolCompletion = boolean
        }
        XCTAssertEqual(boolCompletion, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
