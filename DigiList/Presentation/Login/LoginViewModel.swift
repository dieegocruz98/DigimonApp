//
//  LoginViewModel.swift
//  DigiList
//
//  Created by Cruz Fernández Diego on 1/8/23.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    
    private var realUser: String = "diegocruzz"
    private var realPassword: String = "keepc0ding@"
    
    func login(user: String?, password: String?, completion: (Bool) -> ()) {
        
        guard let user = user else {
          completion(true)
           return
        }
        guard let password = password else {
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
