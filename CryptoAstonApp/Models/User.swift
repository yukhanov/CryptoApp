//
//  User.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 23.12.2022.
//

import Foundation

struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [
        User(login: "1234", password: "1234")
    
    ]
}
