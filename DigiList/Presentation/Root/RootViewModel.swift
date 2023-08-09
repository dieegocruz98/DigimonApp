//
//  RootViewModel.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 8/8/23.
//

import Foundation

enum Status {
    case splash
    case none
    case loading
    case loaded
}


final class RootViewModel: ObservableObject {
    
    // MARK: - Properties
    let repository: RepositoryProtocol
    @Published var status = Status.splash
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func onLogin() {
        
        status = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            status = .loaded
        }
        
    }
    func onLogOut() {
        
        status = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            status = .none
        }
    }
    
    func onSplashDone() {
        status = .none
    }
    
}
