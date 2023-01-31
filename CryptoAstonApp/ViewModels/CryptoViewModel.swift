//
//  CryptoViewModel.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 24.01.2023.
//

import UIKit

struct CryptoViewModel {
    
    var parser = Parser()
    var coinsArray = Dynamic(value: [Data]())
    var coinDetail = Dynamic(value: [Data]())
    
  
    
    func getDataFromApi() {
            parser.parse { data in
                self.coinsArray.value.append(data)
            }
    }

    
}
