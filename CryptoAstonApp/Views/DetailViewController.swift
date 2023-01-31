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
        label.font = label.font.withSize(20)
        label.attributedText = NSAttributedString(string: detailCoinsData[0].name ?? "n/a", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
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
    
    private lazy var priceLabel = CustomLabel()
    
    private lazy var last24HLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.attributedText = NSAttributedString(string: "Last 24 hours", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var openCloseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var openStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var closeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var openLabel: UILabel = {
        let label = UILabel()
        label.text = "Open"
        label.font = label.font.withSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var openValueLabel = CustomLabel()
    
    private lazy var closeLabel: UILabel = {
        let label = UILabel()
        label.text = "Close"
        label.font = label.font.withSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeValueLabel: UILabel = {
        let label = UILabel()
        label.text = String(detailCoinsData[0].marketData.last24Hour.close)
        label.font = label.font.withSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var highLowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var highStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var lowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var highLabel: UILabel = {
        let label = UILabel()
        label.text = "High"
        label.font = label.font.withSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var highValueLabel = CustomLabel()
    
    private lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Low"
        label.font = label.font.withSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lowValueLabel = CustomLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Detail"
        view.backgroundColor = .systemBackground
        setViews()
        setConstraints()
        
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
    }
}

extension DetailViewController {
    func setViews() {
        leftBarButton()
        view.addSubview(nameStackView)
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(symbolLabel)
        view.addSubview(priceLabel)
        view.addSubview(last24HLabel)
        view.addSubview(openCloseStackView)
        openCloseStackView.addArrangedSubview(openStackView)
        openCloseStackView.addArrangedSubview(closeStackView)
        openStackView.addArrangedSubview(openLabel)
        openStackView.addArrangedSubview(openValueLabel)
        closeStackView.addArrangedSubview(closeLabel)
        closeStackView.addArrangedSubview(closeValueLabel)
        view.addSubview(highLowStackView)
        highLowStackView.addArrangedSubview(highStackView)
        highLowStackView.addArrangedSubview(lowStackView)
        highStackView.addArrangedSubview(highLabel)
        highStackView.addArrangedSubview(highValueLabel)
        lowStackView.addArrangedSubview(lowLabel)
        lowStackView.addArrangedSubview(lowValueLabel)
        setValue()
    }
    
    func setValue() {
        priceLabel.text = String(format: "%.2f", detailCoinsData[0].marketData.priceUSD)
        lowValueLabel.text = String(format: "%.2f", detailCoinsData[0].marketData.last24Hour.low)
        openValueLabel.text = String(format: "%.2f", detailCoinsData[0].marketData.last24Hour.open)
        closeValueLabel.text = String(format: "%.2f", detailCoinsData[0].marketData.last24Hour.close)
        highValueLabel.text = String(format: "%.2f", detailCoinsData[0].marketData.last24Hour.high)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            nameStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 10),
            priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            priceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            last24HLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30),
            last24HLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            last24HLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            openCloseStackView.topAnchor.constraint(equalTo: last24HLabel.bottomAnchor, constant: 10),
            openCloseStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            openCloseStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            highLowStackView.topAnchor.constraint(equalTo: openCloseStackView.bottomAnchor, constant: 10),
            highLowStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            highLowStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
    }
}



