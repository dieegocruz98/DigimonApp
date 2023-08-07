//
//  RemoteDataSource.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 3/8/23.
//

import Foundation

final class RemoteDataSource: RemoteDataSourceProtocol {
    
    private let server: String = "https://digimon-api.vercel.app/api/digimon"
    
    func getDigimons() async throws -> [Digimon]? {
        let url = URL(string: server)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let digimons = try JSONDecoder().decode([Digimon].self, from: data)
        
        digimons.forEach {digimon in
            print(digimon.name)
        }
        
        return digimons
    }
}
