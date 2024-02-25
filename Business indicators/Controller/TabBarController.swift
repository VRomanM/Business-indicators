//
//  TabBarController.swift
//  Business indicators
//
//  Created by Роман Вертячих on 01.02.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    private enum TabBarItem: Int {
        case indicators
        case reports
        
        var title: String {
            switch self {
            case .indicators:
                return "Индикаторы"
            case .reports:
                return "Отчеты"
            }
        }
        
        var iconName: String {
            switch self {
            case .indicators:
                return "dollarsign"
            case .reports:
                return "doc.on.doc"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.indicators, .reports]
        self.viewControllers = dataSource.map {
            switch $0 {
            case .indicators:
                let indicatorsViewController = MyIndicatorsViewController()
                return self.wrappedInNavigationController(with: indicatorsViewController, title: $0.title)
            case .reports:
                let reportsViewController = ReportsViewController()
                return self.wrappedInNavigationController(with: reportsViewController, title: $0.title)
            }
        }
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
            $1.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: .zero, bottom: -5, right: .zero)
        }
    }
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
        return UINavigationController(rootViewController: with)
    }
}
