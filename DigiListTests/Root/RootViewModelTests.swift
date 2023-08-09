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
        sut = RootViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSource()))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testRootViewModel_whenLoginStatusChanges_expectStatusEqualsLoaded() throws {
        
//        var statusTest: DigiList.Status = .splash
//        let expectation = XCTestExpectation(description: "400 ERROR")
//        
//        sut!.onLogin(){ status in
//            statusTest = status!
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 2.0)
//        XCTAssertEqual(statusTest, DigiList.Status.loaded)
//        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
