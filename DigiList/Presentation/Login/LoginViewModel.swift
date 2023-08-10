//
//  LoginViewModel.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 1/8/23.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    
    private var realUser: String = "dzz"
    private var realPassword: String = "keep"
    
    func login(user: String?, password: String?, completion: (Bool) -> ()) {
        
        guard let user else {
          completion(true)
           return
        }
        guard let password else {
          completion(true)
           return
        }
        
        if (realUser.elementsEqual(user.lowercased()) && realPassword.elementsEqual(password.lowercased())) {
            completion(false)
        }else {
            completion(true)
        }
        
    }
    
}
