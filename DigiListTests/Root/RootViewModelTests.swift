//
//  RootViewModelTests.swift
//  DigiListTests
//
//  Created by Cruz Fernández Diego on 9/8/23.
//

import XCTest
@testable import DigiList

final class RootViewModelTests: XCTestCase {
    
    var sut: RootViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = RootViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testRootViewModel_whenLoginStatusChanges_expectStatusEqualsLoaded() throws {
        
        let expectation = XCTestExpectation()
        
        XCTAssertEqual(sut?.status, .splash)
        sut?.onLogin()
        
        XCTAssertEqual(sut?.status, .loading)
        sut?.completion = {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.2)
        XCTAssertEqual(self.sut?.status, .loaded)
    }
    
    func testRootViewModel_whenLogOutStatusChanges_expectStatusEqualsNone() throws {
        
        let expectation = XCTestExpectation()
        
        sut?.onLogOut()
        XCTAssertEqual(sut?.status, .loading)
        sut?.completion = {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.7)
        XCTAssertEqual(sut?.status, DigiList.Status.none)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
