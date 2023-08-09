//
//  SettingsView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 8/8/23.
//

import SwiftUI

struct SettingsView: View {
    //MARK: PROPERTIES
    @EnvironmentObject var rootViewModel: RootViewModel
    private let alternateAppIcons: [String] = [
    "AppIcon-blue","AppIcon-red","AppIcon-green","AppIcon-purple",]
    
    var body: some View {
        
        NavigationStack{
            Spacer(minLength: 200)
                .toolbar{
                    Button {
                        rootViewModel.onLogOut()
                    }label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("LogOut")}
                }
            //MARK: CAMBIAR!!
            Section(header: Text("Alternate the Icon App")) {
                ScrollView(showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                                    error in
                                    if error != nil {
                                        print("Failed to set up the app icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success. The App icon is now \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                        }
                        }
                    }.padding(.top, 12)
                }
                Text("Choose your favourite App icon from the collection")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Settings")
            Text("Made with ❤️ by Diego Cruz")
                .padding(10)
                .foregroundColor(.secondary)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
