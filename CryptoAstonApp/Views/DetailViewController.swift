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
   
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = detailCoinsData[0].name
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.text = detailCoinsData[0].symbol
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Detail"
        
        view.backgroundColor = .systemBackground
        setViews()
        setConstraints()
        print("hello world")
        
        
        print(detailCoinsData)
        
    }
    
    func leftBarButton() {
        let leftBarButton = UIBarButtonItem(title: "Back",
                                            style: UIBarButtonItem.Style.done,
                                            target: self,
                                            action: #selector(backToTable))
        navigationItem.leftBarButtonItem = leftBarButton

    }
    
    @objc func backToTable() {
        coordinator?.eventOccured(with: .isUserAuthorised)
        self.dismiss(animated: true)
    }
}

extension DetailViewController {
    func setViews() {
        leftBarButton()
        view.addSubview(nameStackView)
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(symbolLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            nameStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}


