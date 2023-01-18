//
//  CoinsModel.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 11.01.2023.
//



import Foundation

struct Coin: Codable {
    let data: Data
    
}
struct Data: Codable {
    let name: String?
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case name
        case marketData = "market_data"
    }
}

struct MarketData: Codable {
    let priceUSD: Double
    let percentChange24Hours: Double
    
    enum CodingKeys: String, CodingKey {
        case priceUSD = "price_usd"
        case percentChange24Hours = "percent_change_usd_last_24_hours"
    }
}

//struct Coin: Codable {
//    let data: Data
//
//    enum CodingKeys: String, CodingKey {
//        case data = "data"
//    }
//}
//
//struct Data: Codable {
//    let name: String
//    let marketData: MarketData
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case marketData = "market_data"
//    }
//}
//
//
//struct MarketData: Codable {
//    let priceUsd: Double
//    let percentChangeUsdLast24Hours: Float
//
//    enum CodingKeys: String, CodingKey {
//        case priceUsd = "price_usd"
//        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
//    }
//}


















