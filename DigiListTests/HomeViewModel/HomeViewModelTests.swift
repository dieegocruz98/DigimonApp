//
//  HomeViewModelTests.swift
//  DigiListTests
//
//  Created by Cruz Fernández Diego on 10/8/23.
//

import XCTest
@testable import DigiList

final class HomeViewModelTests: XCTestCase {
    
    // var sut: HomeViewModelMock?
    var sut: HomeViewModel?
    // let dataSource = RemoteDataSourceProtocolMock()
    var repositoryMock: RepositoryMockProtocol?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        
        repositoryMock = RepositoryImplMock()
        guard let repositoryMock else {
            return
        }
        sut = HomeViewModel(repository: repositoryMock)
        
        //sut = HomeViewModelMock(repository: RepositoryImplMock(remoteDataSource: RemoteDataSourceMock()))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testHomeViewModel_GetDigimons_expectGetArrayDigimons() {
        let expectation = XCTestExpectation()
        let expectedResult = [Digimon(id: 0, name: "Agumon", img: "", level: "Rookie")]
        repositoryMock?.result = expectedResult
        sut?.onGetDigimonClosure = {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        sut?.getDigimons()
        XCTAssertEqual(sut?.digimons, expectedResult)
    }

    func testHomeViewModel_NoDigimons_expectGetEmptyArrayDigimons() {
        let expectation = XCTestExpectation()
        let expectedResult: [Digimon] = []
        repositoryMock?.result = expectedResult
        sut?.onGetDigimonClosure = {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        sut?.getDigimons()
        XCTAssertEqual(sut?.digimons, expectedResult)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
