//
//  Digimon.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 3/8/23.
//

import Foundation

struct Digimon: Codable, Identifiable, Equatable {
    var id: Int?
    let name: String
    let img: String
    let level: String
}
