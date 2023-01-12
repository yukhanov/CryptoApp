//
//  Coins.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 10.01.2023.
//

import Foundation

struct Coins {
    let name: String
    let cost: String
    let changeInValue: String
    
    static func makeModel() -> [Coins] {
        var model = [Coins]()
        model.append(Coins(name: "Bitcoin", cost: "2000", changeInValue: "+36%"))
        model.append(Coins(name: "Ephir", cost: "1000", changeInValue: "-3%"))
        model.append(Coins(name: "RaveCoin", cost: "350", changeInValue: "+45%"))
        return model
    }
}



