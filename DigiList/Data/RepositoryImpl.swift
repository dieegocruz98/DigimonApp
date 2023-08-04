//
//  RepositoryImpl.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 3/8/23.
//

import Foundation

final class RepositoryImpl: RepositoryProtocol {
    
    // MARK: - Properties
    private let remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    
    func getDigimons() async throws -> [Digimon]? {
        return try? await remoteDataSource.getDigimons()
    }
    
    
}
