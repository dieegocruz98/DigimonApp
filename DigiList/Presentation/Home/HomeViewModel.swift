//
//  HomeViewModel.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 7/8/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // MARK: Properties
    private let repository: RepositoryProtocol
    private var id = 0
    @Published var digimons: [Digimon] = []
    private var digimonsWithID: [Digimon] = []
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        DispatchQueue.main.async {
            Task(priority: .medium){
                guard let digimonsFromApi = try? await repository.getDigimons() else {
                    self.digimons = []
                    print("No se ha podido obtener los digimons del repositorio")
                    return
                }
                
                digimonsFromApi.forEach { digimonApi in
                    self.digimonsWithID.append(Digimon(id: self.id, name: digimonApi.name, img: digimonApi.img, level: digimonApi.level))
                    self.id += 1
                }
                self.digimons = self.digimonsWithID
            }
        }
    }
}
