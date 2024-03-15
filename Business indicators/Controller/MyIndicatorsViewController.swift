//
//  MyIndicatorsViewController.swift
//  Business indicators
//
//  Created by Роман Вертячих on 01.02.2024.
//

import UIKit

class MyIndicatorsViewController: UIViewController, IndicatorsUpdateble {
        
    //MARK: - Views
    
    private lazy var indicatorsTableView: UITableView = {
        let indicatorstableView = UITableView()
        indicatorstableView.delegate = self
        indicatorstableView.dataSource = self
        indicatorstableView.backgroundColor = UIColor.backgroundColor
        return indicatorstableView
    }()
    private let filterStackView = UIStackView()
    private let todayFilterButton = UIButton()
    private let weekFilterButton = UIButton()
    private let monthFilterButton = UIButton()
    private let filterSetupButton = UIButton()
    
    //MARK: - Properties
    
    var indicators = [Indicator]()
    
    //MARK: - Private properties
    
    private let singleCellID = "singleCellID"
    private let multiCellID = "multiCellID"
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorsTableView.register(SingleIndicatorTableViewCell.self, forCellReuseIdentifier: singleCellID)
        indicatorsTableView.register(MultiIndicatorTableViewCell.self, forCellReuseIdentifier: multiCellID)
        configureView()
        discribeElementsView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let heightFilterStackView: CGFloat = 40
        let heightIndicatorsTableView: CGFloat = view.frame.height - heightFilterStackView - view.safeAreaInsets.top  - (tabBarController?.tabBar.frame.height ?? 0)
        
        indicatorsTableView.frame = .init(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: heightIndicatorsTableView)
        filterStackView.frame = .init(x: 0, y: indicatorsTableView.frame.maxY, width: view.frame.width, height: heightFilterStackView)
    }
    
    //MARK: - Function
    
    func indicatorsUpdate(indicator: Indicator) {
        if !indicators.contains(where: { $0 == indicator }){
            indicators.append(indicator)
            indicatorsTableView.reloadData()
        }
    }
    
    //MARK: Private function
    
    private func configureView(){
        view.backgroundColor = UIColor.backgroundColor
        view.addSubview(indicatorsTableView)
        view.addSubview(filterStackView)
                
        filterStackView.alignment = .fill
        filterStackView.distribution = .fillEqually
        filterStackView.spacing = 1
                
        filterStackView.addArrangedSubview(todayFilterButton)
        filterStackView.addArrangedSubview(weekFilterButton)
        filterStackView.addArrangedSubview(monthFilterButton)
        filterStackView.addArrangedSubview(filterSetupButton)
        
//        todayFilterButton.translatesAutoresizingMaskIntoConstraints = false
//        weekFilterButton.translatesAutoresizingMaskIntoConstraints = false
//        monthFilterButton.translatesAutoresizingMaskIntoConstraints = false
//        filterSetupButton.translatesAutoresizingMaskIntoConstraints = false
        
        let addInicatorUIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addIndicator))
        navigationItem.rightBarButtonItem = addInicatorUIBarButtonItem
        
    }
    
    private func discribeElementsView(){
        navigationItem.title = "Индикаторы"
                
        todayFilterButton.backgroundColor = UIColor.backgroundColor
        todayFilterButton.setTitle("Сегодня", for: .normal)
        
        weekFilterButton.backgroundColor = UIColor.backgroundColor
        weekFilterButton.setTitle("Неделя", for: .normal)
        
        monthFilterButton.backgroundColor = UIColor.backgroundColor
        monthFilterButton.setTitle("Квартал", for: .normal)
        
        filterSetupButton.backgroundColor = UIColor.backgroundColor
        filterSetupButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        filterSetupButton.imageView?.tintColor = .white
    }

    @objc private func addIndicator(){
        let indicatorsViewController = IndicatorsViewController()
        indicatorsViewController.handleUpdatedIndicatorsDelegate = self
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
        indicators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let singleIndicator = self.indicators[indexPath.row] as? SingleIndicator {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: singleCellID, for: indexPath) as? SingleIndicatorTableViewCell else { return UITableViewCell() }
            cell.configureCell(indicator: singleIndicator)
            return cell
        } else if let multiIndicator = self.indicators[indexPath.row] as? MultiIndicator {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: multiCellID, for: indexPath) as? MultiIndicatorTableViewCell else { return UITableViewCell() }
            cell.configureCell(indicator: multiIndicator)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
