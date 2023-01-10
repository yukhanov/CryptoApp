//
//  CryptoCell.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 27.12.2022.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    static let identifier = "CryptoCell"
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
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
    
    func layout() {
        [whiteView, nameOfCoinLabel, changeInValueLabel].forEach { contentView.addSubview($0) }
        
        let viewInset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset)
        
        ])
    }
}
