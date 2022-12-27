//
//  LoginViewModel.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 23.12.2022.
//

import Foundation
import UIKit.UIColor

class LoginViewModel {
    var statusText = Dynamic(value: "")
    var statusColor = Dynamic(value: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    
    func enterButtonTapped(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password {
            statusText.value = "Log in failed"
            statusColor.value = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        } else {
            statusText.value = "You succesfully logged in"
            statusColor.value = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
    }
}
