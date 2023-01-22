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
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var spinner: CustomSpinner = {
        let spinner = CustomSpinner(squareLength: 100)
        return spinner
    }()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Crypto"
        //loader()
        
        
       
        leftBarButton()
        setViews()
        setConstraints()
        setDataToTableView()
    }
    

    override func viewDidAppear(_ animated: Bool) {
       
        
     
        
    }
    
    override func viewDidLayoutSubviews() {
        
    }

    
    
    func leftBarButton() {
        let leftBarButton = UIBarButtonItem(title: "Logout",
                                            style: UIBarButtonItem.Style.done,
                                            target: self,
                                            action: #selector(goToLogin))
        navigationItem.leftBarButtonItem = leftBarButton

    }
    
    @objc func goToLogin() {
        UserDefaults.standard.set(false, forKey: "isAuthorised")
        coordinator?.eventOccured(with: .logout)
    }
    
    func setDataToTableView() {
        self.parser.parse() { data in
            self.coins.append(data)
         
            DispatchQueue.main.async {
                self.cryptoTableView.reloadData()
                self.spinner.stopAnimation()

            }
            //self.stopLoader(loader: self.loader())
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
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
