//
//  ViewController.swift
//  CryptoAstonApp
//
//  Created by Сергей Юханов on 23.12.2022.
//

import UIKit

class LoginViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    var loginViewModel = LoginViewModel()
    
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Login"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "valid"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enterButton = CustomButton()
    
    private lazy var loginStackView = UIStackView(arrangedSubviews: [nameTextField, passwordTextField, enterButton], axis: .vertical, spacing: 40)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        setSubViews()
        setConstraints()
        checkAuthorised()
        bindViewModel()

        enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
    func setSubViews() {
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(enterButton)
        view.addSubview(statusLabel)
    }
    
    func bindViewModel() {
        loginViewModel.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
        loginViewModel.statusColor.bind({ (statusColor) in
            DispatchQueue.main.async {
                self.statusLabel.textColor = statusColor
            }
        })
    }
    
    func checkAuthorised() {
        if UserDefaults.standard.bool(forKey: "isAuthorised") == true {
            coordinator?.eventOccured(with: .isUserAuthorised)
        }
    }
    
    @objc func enterButtonTapped() {
        loginViewModel.enterButtonTapped(login: nameTextField.text ?? "", password: passwordTextField.text ?? "")
        statusLabel.isHidden = false
        if nameTextField.text == User.logins[0].login && passwordTextField.text == User.logins[0].password {
            coordinator?.eventOccured(with: .loginButtonTapped)
            User.logins[0].isUserAuthorised = true
            UserDefaults.standard.set(nameTextField.text, forKey: "login")
            UserDefaults.standard.set(passwordTextField.text, forKey: "password")
            UserDefaults.standard.set(true, forKey: "isAuthorised")
            
        }
    }
}

extension LoginViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            nameTextField.widthAnchor.constraint(equalToConstant: 250),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 20),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

