//
//  LoginView.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 1/8/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var user = ""
    @State private var password = ""
    @State private var showPopup = false
    
    
    var body: some View {
        ZStack{
            
            Image(decorative: "LoginBackground")
                .resizable()
                .ignoresSafeArea()
            
            // MARK: - User, password login button
            VStack {
                
                // MARK: - User, password
                VStack {
                    TextField("User mail", text: $user)
                        .padding(10)
                        .background(.white)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                    
                    Spacer()
                        
                    SecureField("Password", text: $password)
                        .padding(10)
                        .background(.white)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    
                }
                .frame(width: 272, height: 112)
                
                Spacer()
                
                // MARK: - Login button
                Button {
                    self.showPopup = true
                    //rootViewModel.onLogin(user: "bejl@keepcoding.es", password: "123456")
                } label: {
                    Text("Login")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 138, height: 40)
                        .background(Color(uiColor: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)))
                        .cornerRadius(8.0)
                        .shadow(radius: 10, x: 20, y: 10)
                }
                .alert(isPresented: $showPopup) {
                    Alert(
                        title: Text("Incorrect Username or Password"),
                        message: Text("Try again!😳"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .frame(width: 272, height: 216)
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}