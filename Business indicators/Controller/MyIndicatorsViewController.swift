//
//  MyIndicatorsViewController.swift
//  Business indicators
//
//  Created by Роман Вертячих on 01.02.2024.
//

import UIKit

class MyIndicatorsViewController: UIViewController {
    //MARK: - Views
    private lazy var indicatorsTableView: UITableView = {
        let indicatorstableView = UITableView()
        indicatorstableView.delegate = self
        indicatorstableView.dataSource = self
        return indicatorstableView
    }()
    private let filterStackView = UIStackView()
    
    //MARK: - Private properties
    private let cellID = "cellId"
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorsTableView.register(SingleIndicatorTableViewCell.self, forCellReuseIdentifier: cellID)
        configureView()
        discribeElementsView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let heightFilterStackView: CGFloat = 100
        let heightIndicatorsTableView: CGFloat = view.frame.height - heightFilterStackView - view.safeAreaInsets.top  - (tabBarController?.tabBar.frame.height ?? 0)
        
        indicatorsTableView.frame = .init(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: heightIndicatorsTableView)
        filterStackView.frame = .init(x: 0, y: indicatorsTableView.frame.maxY, width: view.frame.width, height: heightFilterStackView)
    }
    
    //MARK: Private function
    private func configureView(){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(indicatorsTableView)
        view.addSubview(filterStackView)
        
        let openInicatorUIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openIndicatorsViewController))
        navigationItem.rightBarButtonItem = openInicatorUIBarButtonItem
    }
    
    private func discribeElementsView(){
        navigationItem.title = "Индикаторы" 

    }

    @objc private func openIndicatorsViewController(){
        let indicatorsViewController = IndicatorsViewController()
        self.navigationController?.pushViewController(indicatorsViewController, animated: true)
    }
}

extension MyIndicatorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MyIndicatorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? SingleIndicatorTableViewCell else {
            preconditionFailure("Error")
        }
        //cell.configureCell(imageName: "person.slash.fill")
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
