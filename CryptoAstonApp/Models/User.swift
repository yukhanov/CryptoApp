//
//  User.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 23.12.2022.
//

import Foundation


struct User {
 //   let userDefaults = UserDefaults.standard
    let login: String?
    let password: String?
    let name = ""
    var isUserAuthorised = false

   
//    userDefaults.setValue("1234", forKey: login)
//    userDefaults.setValue("1234", forKey: password)
}

extension User {
    static var logins = [
        User(login: "1234", password: "1234", isUserAuthorised: false)
    ]
  
}
