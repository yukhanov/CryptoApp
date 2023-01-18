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
    let parser = Parser()
    var coins = [Data]()

    
    
    private lazy var cryptoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CryptoCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        parser.parse { data in
            self.coins.append(data)
           // print(self.coins)
        }
        
        view.backgroundColor = .white
        title = "Crypto"
        
       
        setViews()
        setConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
        
            self.cryptoTableView.reloadData()
        }
        
        
      
        print(coins)
      
    }
    
    
    func setViews() {
    
        view.addSubview(cryptoTableView)
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
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CryptoCell
        cell.setupCell(coins[indexPath.row])
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
