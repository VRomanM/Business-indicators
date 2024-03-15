//
//  LoginViewController.swift
//  Business indicators
//
//  Created by Роман Вертячих on 31.01.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Private properties
    private let loginTextField: UITextField = UITextField()
    private let passwordTextField: UITextField = UITextField()
    private let signInButton: UIButton = UIButton()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundColor
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
//        passwordTextField.center = .init(x: loginTextField.center.x - loginTextField.frame.width / 2, y: loginTextField.center.y + loginTextField.frame.height / 2 + 15)
//        passwordTextField.frame.size = .init(width: elementWidth, height: elementHeight)
        passwordTextField.frame = .init(x: loginTextField.frame.minX, y: loginTextField.frame.maxY + 15, width: elementWidth, height: elementHeight)
        signInButton.frame      = .init(x: passwordTextField.frame.minX + 10, y: passwordTextField.frame.maxY + 50, width: elementWidth - 20, height: elementHeight)
    }
    
    //MARK: Private function
    
    private func addElementsView(){
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
    }
    
    private func discribeElementsView(){
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "login"
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "password"
        
        signInButton.backgroundColor = .buttonColor
        signInButton.layer.cornerRadius = 5
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchDown)
    }
    
    @objc private func signIn(){
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundImage = UIImage()
        tabBarController.tabBar.tintColor = UIColor.selectedTextColor
        tabBarController.tabBar.unselectedItemTintColor = UIColor.unselectedTextColor
        
        let indicatorsNavigationController = UINavigationController(rootViewController: MyIndicatorsViewController())
        indicatorsNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        indicatorsNavigationController.navigationBar.shadowImage = UIImage()
        indicatorsNavigationController.navigationBar.tintColor = UIColor.textColor
        indicatorsNavigationController.navigationBar.barStyle = .black
        
        if #available(iOS 11.0, *) {
            indicatorsNavigationController.navigationBar.prefersLargeTitles = true
        }
        
        let reportsNavigationController = UINavigationController(rootViewController: ReportsViewController())
        tabBarController.viewControllers = [indicatorsNavigationController, reportsNavigationController]
        indicatorsNavigationController.tabBarItem.title = "Индикаторы"
        indicatorsNavigationController.tabBarItem.image = UIImage(systemName: "dollarsign")
        
        reportsNavigationController.tabBarItem.title = "Отчеты"
        reportsNavigationController.tabBarItem.image = UIImage(systemName: "doc.on.doc")
        
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
    }
}

