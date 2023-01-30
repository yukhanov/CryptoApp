//
//  DetailViewController.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 23.01.2023.
//

import UIKit


class DetailViewController: UIViewController, CoordinatingAndData {
    var detailCoinsData = [Data]()
    
    var coordinator: Coordinator?
    private let detailViewModel = DetailViewModel()
   

   
  
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "HI"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Detail"
        view.backgroundColor = .systemBackground
        view.addSubview(detailLabel)
        setConstraints()
        print("hello world")
      
        print(detailCoinsData)
        
    }
    
}

extension DetailViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailLabel.heightAnchor.constraint(equalToConstant: 20),
            detailLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
