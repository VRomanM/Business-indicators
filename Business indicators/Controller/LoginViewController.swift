//
//  LoginViewController.swift
//  Business indicators
//
//  Created by Роман Вертячих on 31.01.2024.
//

import UIKit

class LoginViewController: UIViewController {
    let loginTextField: UITextField = UITextField()
    let passwordTextField: UITextField = UITextField()
    let signInButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        addElementsView()
        discribeElementsView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let elementWidth: CGFloat = round(view.frame.width / 3)
        let elementHeight: CGFloat = round(view.frame.height / 25)
        
        loginTextField.frame    = .init(x: round(view.frame.width / 2 - elementWidth / 2), y: round(view.frame.height / 3), width: elementWidth, height: elementHeight)
        passwordTextField.frame = .init(x: loginTextField.frame.minX, y: loginTextField.frame.maxY + 15, width: elementWidth, height: elementHeight)
        signInButton.frame      = .init(x: passwordTextField.frame.minX + 10, y: passwordTextField.frame.maxY + 50, width: elementWidth - 20, height: elementHeight)
    }
    
    private func addElementsView(){
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
    }
    
    private func discribeElementsView(){
        loginTextField.layer.borderColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "login"
        
        passwordTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "password"
        
        signInButton.backgroundColor = #colorLiteral(red: 0, green: 0.4910776615, blue: 1, alpha: 1)
        signInButton.layer.cornerRadius = 5
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchDown)
    }
    
    @objc private func signIn(){
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
    }
}

