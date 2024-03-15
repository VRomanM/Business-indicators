//
//  IndicatorsViewController.swift
//  Business indicators
//
//  Created by Роман Вертячих on 08.02.2024.
//

import UIKit

class IndicatorsViewController: UIViewController {
    
    //MARK: - View
    
    lazy var indicatorsTableView: UITableView = {
        let indicatorsTableView = UITableView()
        indicatorsTableView.delegate = self
        indicatorsTableView.dataSource = self
        indicatorsTableView.backgroundColor = UIColor.backgroundColor
        return indicatorsTableView
    }()
    
    //MARK: - Properties
    
    var handleUpdatedIndicatorsDelegate: IndicatorsUpdateble?
    
    //MARK: - Private properties
    
    private let singleCellID = "singleCellID"
    private let multiCellID = "multiCellID"
    private var indicators = [Indicator]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorsTableView.register(SingleIndicatorTableViewCell.self, forCellReuseIdentifier: singleCellID)
        indicatorsTableView.register(MultiIndicatorTableViewCell.self, forCellReuseIdentifier: multiCellID)
        configureView()
        self.indicators = Api.shared.getIndicators()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let heightIndicatorsTableView: CGFloat = view.frame.height - view.safeAreaInsets.top - (tabBarController?.tabBar.frame.height ?? 0)
        indicatorsTableView.frame = .init(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: heightIndicatorsTableView)
    }
    
    //MARK: Private function
    
    private func configureView() {
        view.backgroundColor = UIColor.backgroundColor
        view.addSubview(indicatorsTableView)
    }
}

extension IndicatorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        handleUpdatedIndicatorsDelegate?.indicatorsUpdate(indicator: indicators[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
}

extension IndicatorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
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
        80
    }
}
