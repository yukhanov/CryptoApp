//
//  CryptoViewController.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 26.12.2022.
//

import Foundation
import UIKit

class CryptoViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    
    private var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "valid"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Crypto"
        setViews()
        setConstraints()
    }
    
    func setViews() {
        view.addSubview(secondLabel)
    }
}

extension CryptoViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        
        ])
    }
}
