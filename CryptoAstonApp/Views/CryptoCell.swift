//
//  CryptoCell.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 27.12.2022.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    static let identifier = "CryptoCell"
    
    private let nameOfCoinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changeInValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: Data) {
        nameOfCoinLabel.text = model.name
        costLabel.text = String(format: "%.2f", model.marketData.priceUSD) + "$"
        changeInValueLabel.text = String(format: "%.2f", model.marketData.percentChange24Hours) + "%"
    }

    
    func layout() {
        [nameOfCoinLabel, costLabel, changeInValueLabel].forEach { contentView.addSubview($0) }
        

        NSLayoutConstraint.activate([
            nameOfCoinLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameOfCoinLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
         
     
        ])
        NSLayoutConstraint.activate([
            costLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            costLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        
  
        ])
        NSLayoutConstraint.activate([
            changeInValueLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            changeInValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
