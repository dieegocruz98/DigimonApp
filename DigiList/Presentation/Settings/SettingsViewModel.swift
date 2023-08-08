//
//  SettingsViewModel.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 8/8/23.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    var rootViewModel: RootViewModel
    
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
    
    func logOut(){
        rootViewModel.onLogOut()
    }
    
}
