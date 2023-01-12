//
//  Parser.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 11.01.2023.
//

import Foundation

class Parser {
    func parse() {
        let api = URL(string: "https://data.messari.io/api/v1/assets/btc/metrics")
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let result = try JSONDecoder().decode(CoinsModel.self, from: data!)
                print(result)
            } catch {
                
            }
        }.resume()
    }
}
