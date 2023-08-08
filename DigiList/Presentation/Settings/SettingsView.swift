//
//  SettingsView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 8/8/23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack{
            Text("")
            .navigationTitle("Settings")
            .toolbar{
                Button {
                    settingsViewModel.logOut()
                }label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    Text("LogOut")}
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsViewModel(rootViewModel: RootViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSource()))))
    }
}
