//
//  AppCoordinator.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 26.12.2022.
//

import UIKit

class AppCoordinator: Coordinator {

    
    var navigationController: UINavigationController?

    
    func start() {
        var vc: UIViewController & Coordinating = LoginViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .loginButtonTapped:
            var vc: UIViewController & Coordinating = CryptoViewController()
            vc.coordinator = self
            navigationController?.setViewControllers([vc], animated: true)
        case .isUserAuthorised:
            var vc: UIViewController & Coordinating = CryptoViewController()
            vc.coordinator = self
            navigationController?.setViewControllers([vc], animated: true)
        }
    }
    
    
}
