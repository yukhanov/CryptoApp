//
//  DetailViewModel.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 27.01.2023.
//

import Foundation

class DetailViewModel {
    
    var coin = Dynamic(value: [Data]())
    var infoAboutCoin = Dynamic(value: [Data]())
    var completionHandler: ((Data) -> Void)?
    
    
    func getDataFromCryptoVC() {
        
    }
}
