//
//  HomeView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 7/8/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var isAnimatingImage: Bool = false
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                List{
                    ForEach(homeViewModel.digimons) {digimon in
                        NavigationLink {
                            VStack{
                                AsyncImage(url: URL(string: digimon.img),
                                           content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                           placeholder: {
                                    ProgressView()
                                })
                                HStack{
                                    Text("Level 💪🏻 ")
                                        .font(.system(size: 30))
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text(digimon.level)
                                        .font(.system(size: 30))
                                        .foregroundStyle(LinearGradient(
                                            colors: [.blue, .yellow, .green],
                                            startPoint: .bottomLeading,
                                            endPoint: .topTrailing))
                                }
                            }
                            .navigationTitle(digimon.name)
                        }label: {
                            DigimonCellView(digimon: digimon)
                        }
                    }
                }
                .navigationTitle("Digimon's 👾")
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSource())))
    }
}
