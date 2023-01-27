//
//  CryptoViewModel.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 24.01.2023.
//

import UIKit

class CryptoViewModel {
    
    var parser = Parser()
    var coinsArray = Dynamic(value: [Data]())
    
    func getDataFromApi() {
      
            parser.parse { data in
                self.coinsArray.value.append(data)
            }
    }
    
    func sendDataToDetail() {
        
    }
    
}
