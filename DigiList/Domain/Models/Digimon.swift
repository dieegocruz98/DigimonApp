//
//  Digimon.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 3/8/23.
//

import Foundation

struct Digimon: Decodable, Identifiable {
    var id: String
    let name: String
    let img: URL
    let level: String
}
