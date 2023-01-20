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
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
