//
//  HomeView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 7/8/23.
//

import SwiftUI

enum DigimonLevels: String, CaseIterable, Identifiable {
    case all = "All"
    case fresh = "Fresh"
    case training = "In Training"
    case rookie = "Rookie"
    case champion = "Champion"
    case ultimate = "Ultimate"
    case mega = "Mega"
    
    var id: DigimonLevels {self}
}

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var searchedText: String = ""
    @State private var selectedLevel: DigimonLevels = .all
    
    var levelSelectedDigimon: [Digimon] {
        switch (selectedLevel){
        case .all:
            return homeViewModel.digimons
        default:
            return homeViewModel.digimons.filter {$0.level.contains(selectedLevel.rawValue)}
        }
    }
    
    var searchedDigimons: [Digimon] {
        if searchedText.isEmpty {
            return levelSelectedDigimon
        } else {
            return levelSelectedDigimon.filter {$0.name.contains(searchedText)}
        }
    }
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                List{
                    ForEach(searchedDigimons) {digimon in
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
                                .accessibility(label: Text("This Digimon is: \(digimon.name)"))
                                .accessibilityHint(Text("Press to enter to \(digimon.name)"))
                        }
                    }
                }
                .refreshable {
                    selectedLevel = .all
                }
                .searchable(text: $searchedText)
                .toolbar {
                    ToolbarItem {
                        HStack(spacing: 0) {
                            Picker("Digimon level", selection: $selectedLevel){
                                ForEach(DigimonLevels.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .foregroundColor(.blue)
                                .symbolVariant((selectedLevel != DigimonLevels.all) ? .fill : .none)
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
