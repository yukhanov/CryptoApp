//
//  Parser.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 11.01.2023.
//

import Foundation


class Parser {
    let nameOfCoins = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
    
    func parse(completion: @escaping (Data)->()) {
        for coinsName in nameOfCoins {
            let url = URL(string: "https://data.messari.io/api/v1/assets/\(coinsName)/metrics")
            URLSession.shared.dataTask(with: url!) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription as Any)
                    return
                }
                do {
                    let result = try? JSONDecoder().decode(Coin.self, from: data!)
                    completion(result?.data ?? Data(name: coinsName, symbol: "n/a", marketData: MarketData(priceUSD: 0, percentChange24Hours: 0, volumeLast24Hours: 0, last24Hour: Last24Hour.init(open: 0, high: 0, low: 0, close: 0, volume: 0))))
                } catch {
                    print(error)
                }
            }.resume()
        }


    }
}
