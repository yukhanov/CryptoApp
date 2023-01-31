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
    let cellID = CryptoCell.identifier
    var isSortedByAscending = true
    private let cryptoViewModel = CryptoViewModel()
    var coins = [Data]()
    var coinSelected: ((Data) -> Void)?

    
    lazy var cryptoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CryptoCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var spinner: CustomSpinner = {
        let spinner = CustomSpinner(squareLength: 100)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto"
        view.backgroundColor = .systemBackground
        leftBarButton()
        rightBarItem()
        setViews()
        setConstraints()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        bindViewModel()
    }
    

    
    
    func leftBarButton() {
        let leftBarButton = UIBarButtonItem(title: "Logout",
                                            style: UIBarButtonItem.Style.done,
                                            target: self,
                                            action: #selector(goToLogin))
        navigationItem.leftBarButtonItem = leftBarButton

    }
    
    func rightBarItem() {
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                           target: self,
                                           action: #selector(sortArrayByChanging))
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc func sortArrayByChanging() {
        if isSortedByAscending == false {
            cryptoViewModel.coinsArray.value.sort(by: { $0.marketData.percentChange24Hours > $1.marketData.percentChange24Hours} )
            isSortedByAscending = true
        } else {
            cryptoViewModel.coinsArray.value.sort(by: { $0.marketData.percentChange24Hours < $1.marketData.percentChange24Hours} )
            isSortedByAscending = false
        }

        cryptoTableView.reloadData()
       
    }
    
    
    @objc func goToLogin() {
        UserDefaults.standard.set(false, forKey: "isAuthorised")
        coordinator?.eventOccured(with: .logout)
        self.dismiss(animated: false)
    }
    

    func bindViewModel () {
        cryptoViewModel.getDataFromApi()
        self.cryptoViewModel.coinsArray.bind { coins in
            self.coins = coins
            DispatchQueue.main.async {
                self.spinner.stopAnimation()
                self.cryptoTableView.reloadData()
            }
        }
    }
    
    
    func setViews() {
        view.addSubview(cryptoTableView)
        view.addSubview(spinner)
        spinner.startAnimation(delay: 0.04, replicates: 20)
    }
}

extension CryptoViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            cryptoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cryptoTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cryptoTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            cryptoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoViewModel.coinsArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CryptoCell
        cell.setupCell(cryptoViewModel.coinsArray.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = coins[indexPath.row]
        cryptoViewModel.coinDetail.value.append(coin)
        print(cryptoViewModel.coinDetail.value)
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.eventOccured(with: .goToDetailVC(coin))
    }
}
