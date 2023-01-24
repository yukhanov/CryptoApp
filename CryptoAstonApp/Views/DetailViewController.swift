//
//  DetailViewController.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 23.01.2023.
//

import UIKit


class DetailViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Detail"
        view.backgroundColor = .systemBlue
    }
    
    
}
