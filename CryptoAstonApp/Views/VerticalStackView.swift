//
//  VerticalStackView.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 31.01.2023.
//

import UIKit

class VerticalStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func configure() {
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        spacing = 10
    }
}
