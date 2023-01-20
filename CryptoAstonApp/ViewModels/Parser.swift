//
//  Parser.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 11.01.2023.
//

import Foundation

enum CoinsName: String {
    
    case btc = "btc"
    case eth = "eth"
    case tron = "tron"
    case luna = "luna"
    case polkadot = "polkadot"
    case dogecoin = "dogecoin"
    case tether = "tether"
    case stellar = "stellar"
    case cardano = "cardano"
    case xrp = "xrp"
}

class Parser {
    func parse(completion: @escaping (Data)->()) {
        let api = URL(string: "https://data.messari.io/api/v1/assets/\(CoinsName.stellar.rawValue)/metrics")
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Coin.self, from: data!)
                completion(result.data)
            } catch {
                print(error)
            }
        }.resume()
    }
}
