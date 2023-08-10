//
//  RepositoryImplMock.swift
//  DigiListTests
//
//  Created by Cruz Fernández Diego on 10/8/23.
//

import Foundation

@testable import DigiList

protocol RepositoryMockProtocol: RepositoryProtocol {
    var result: [Digimon]? { get set }
}

final class RepositoryImplMock: RepositoryMockProtocol {
    // MARK: - Properties
    var result: [Digimon]?
    
    func getDigimons() async throws -> [Digimon]? {
        result
    }
}
