//
//  ReportsViewController.swift
//  Business indicators
//
//  Created by Роман Вертячих on 01.02.2024.
//

import UIKit

class ReportsViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let brush = UIColor()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = brush.backgroundColor()
    }
}
