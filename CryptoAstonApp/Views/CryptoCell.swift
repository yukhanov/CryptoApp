//
//  CryptoCell.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 27.12.2022.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    static let identifier = "CryptoCell"
    
//    private let whiteView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()
    
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
    
    func setupCell(_ model: Coins) {
        nameOfCoinLabel.text = model.name
        costLabel.text = model.cost
        changeInValueLabel.text = model.changeInValue
    }
    
    func layout() {
        [nameOfCoinLabel, costLabel, changeInValueLabel].forEach { contentView.addSubview($0) }
        
      
        
        
//        NSLayoutConstraint.activate([
//            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
//            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
//            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
//            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset)
//        ])
        NSLayoutConstraint.activate([
            nameOfCoinLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
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
