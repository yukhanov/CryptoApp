//
//  CustomLabel.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 31.01.2023.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = String(format: "%.2f")
        font = font.withSize(17)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
