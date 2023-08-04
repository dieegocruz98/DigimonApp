//
//  RepositoryProtocol.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 3/8/23.
//

import Foundation

protocol RepositoryProtocol {
    func getDigimons() async throws -> [Digimon]?
}
