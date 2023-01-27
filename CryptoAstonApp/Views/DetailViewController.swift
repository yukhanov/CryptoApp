//
//  DetailViewController.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 23.01.2023.
//

import UIKit


class DetailViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    private lazy var detailTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Hello"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Detail"
        view.backgroundColor = .systemBackground
        setConstraints()
    }
    
    
}

extension DetailViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            detailTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           // detailTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
