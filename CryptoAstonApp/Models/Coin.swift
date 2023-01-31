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
    let symbol: String?
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case name
        case symbol
        case marketData = "market_data"
    }
}

struct MarketData: Codable {
    let priceUSD: Double
    let percentChange24Hours: Double
    let volumeLast24Hours: Double
    let last24Hour: Last24Hour
    
    enum CodingKeys: String, CodingKey {
        case priceUSD = "price_usd"
        case percentChange24Hours = "percent_change_usd_last_24_hours"
        case volumeLast24Hours = "volume_last_24_hours"
        case last24Hour = "ohlcv_last_24_hour"
    }
}

struct Last24Hour: Codable {
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Double
}










