//
//  CustomButton.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 26.12.2022.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Enter", for: .normal)
        backgroundColor = .white
        setTitleColor(.systemBlue, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel?.numberOfLines = 1
        layer.borderWidth = 2
        layer.cornerRadius = 25
        layer.borderColor = UIColor.systemBlue.cgColor
        contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        translatesAutoresizingMaskIntoConstraints = false
    }
  
}

