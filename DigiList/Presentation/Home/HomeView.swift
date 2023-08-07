//
//  HomeView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 7/8/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        
        List{
            ForEach(homeViewModel.digimons) {digimon in
                DigimonCellView(digimon: digimon)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSource())))
    }
}
