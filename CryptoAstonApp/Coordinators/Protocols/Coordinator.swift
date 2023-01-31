//
//  Coordinator.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 26.12.2022.
//

import UIKit

enum Event {
    case loginButtonTapped
    case isUserAuthorised
    case logout
    case goToDetailVC(Data)
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

protocol CoordinatingAndData {
    var coordinator: Coordinator? { get set }
    var detailCoinsData: [Data] { get set }
}
