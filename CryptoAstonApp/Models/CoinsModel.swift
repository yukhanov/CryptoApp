////
////  CoinsModel.swift
////  CryptoAstonApp
////
////  Created by Сергей Юханов on 11.01.2023.
////
//
//import Foundation
//
////   let coinsModel = try? JSONDecoder().decode(CoinsModel.self, from: jsonData)
//
import Foundation

// MARK: - CoinsModel
struct CoinsModel: Codable {
    //let status: Status
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: String
    let serialID: Int
    let name: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case serialID = "serial_id"
        case name
        
    }
}
//
//// MARK: - AllTimeHigh
//struct AllTimeHigh: Codable {
//    let price: Double
//    let at: Date
//    let daysSince: Int
//    let percentDown, breakevenMultiple: Double
//
//    enum CodingKeys: String, CodingKey {
//        case price, at
//        case daysSince = "days_since"
//        case percentDown = "percent_down"
//        case breakevenMultiple = "breakeven_multiple"
//    }
//}
//
//// MARK: - CycleLow
//struct CycleLow: Codable {
//    let price: Double
//
//
//    enum CodingKeys: String, CodingKey {
//        case price
//
//    }
//}
//
//
//
//// MARK: - MarketData
//    struct MarketData: Codable {
//        let priceUsd, priceBtc: Double
//        let priceEth: Int
//        let volumeLast24_Hours, realVolumeLast24_Hours, volumeLast24_HoursOverstatementMultiple: Double
//        let percentChangeUsdLast1_Hour, percentChangeBtcLast1_Hour, percentChangeEthLast1_Hour: JSONNull?
//        let percentChangeUsdLast24_Hours, percentChangeBtcLast24_Hours, percentChangeEthLast24_Hours: Double
//        let ohlcvLast1_Hour: JSONNull?
//        
//        
//        enum CodingKeys: String, CodingKey {
//            case priceUsd = "price_usd"
//            case priceBtc = "price_btc"
//            case priceEth = "price_eth"
//            case percentChangeUsdLast1_Hour = "percent_change_usd_last_1_hour"
//            case percentChangeBtcLast1_Hour = "percent_change_btc_last_1_hour"
//            case percentChangeEthLast1_Hour = "percent_change_eth_last_1_hour"
//            
//        }
//    }
//
//
//
//
//// MARK: - Status
//struct Status: Codable {
//    let elapsed: Int
//    let timestamp: String
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
