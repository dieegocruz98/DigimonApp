//
//  DigiListApp.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 1/8/23.
//

import SwiftUI

@main
struct DigiListApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSource())))
            //LoginView()
            //.environmentObject(LoginViewModel())
            RootView()
                .environmentObject(RootViewModel())
        }
    }
}
