//
//  Parser.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 11.01.2023.
//

import Foundation

class Parser {
    
    func parse(completion: @escaping (Data)->()) {
        let api = URL(string: "https://data.messari.io/api/v1/assets/btc/metrics")
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Coin.self, from: data!)
                //let result = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                print(result)
                
                completion(result.data)
                
            } catch {
                print(error)
            }
        }.resume()
    }
}
