//
//  CryptoTableView.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 27.12.2022.
//

import UIKit

class  CryptoTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CryptoCell()
        return cell
    }
    
    
}
