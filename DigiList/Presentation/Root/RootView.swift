//
//  RootView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 8/8/23.
//

import SwiftUI

struct RootView: View {
    
    // MARK: - Properties
    @EnvironmentObject var rootViewModel: RootViewModel
    
    
    
    var body: some View {
        switch (rootViewModel.status) {
            
        case Status.splash:
            SplashView()
            
        case Status.none:
            LoginView().environmentObject(LoginViewModel())
            
        case Status.loading:
            ProgressView()
            
        case Status.loaded:
            TabView {
                HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSource())))
                    .tabItem {
                        Label("Digimon List", systemImage: "list.dash")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
