//
//  Api.swift
//  Business indicators
//
//  Created by Роман Вертячих on 04.02.2024.
//

import UIKit

class Api {
    //MARK: - Properties
    static let shared = Api()
    
    //MARK: - Function
    func getIndicators() -> [Indicator] {
        var indicators = [Indicator]()
        indicators.append(SingleIndicator(id: 0, title: "Валовая прибыль", value: "10 000 000", image: UIImage(systemName: "banknote")))
        indicators.append(SingleIndicator(id: 1, title: "Оборот", value: "20 000 000", image: UIImage(systemName: "bag.badge.plus")))
        indicators.append(SingleIndicator(id: 2, title: "Себестоимость", value: "2 000 000", image: nil))
        indicators.append(SingleIndicator(id: 1, title: "Прибыль", value: "5 000 000", image: UIImage(systemName: "bag.badge.plus")))
        indicators.append(MultiIndicator(id: 3, title: "Топ продаж", values: ["Молоко", "Яблоки", "Фрукты"], image: nil))
        indicators.append(MultiIndicator(id: 0, title: "Макс. хранение", values: ["Сигареты", "Спички", "Зажигалки"], image: UIImage(systemName: "banknote")))
        indicators.append(SingleIndicator(id: 2, title: "Тест 1", value: "2 000 000", image: nil))
        indicators.append(SingleIndicator(id: 3, title: "Тест 2", value: "", image: nil))
        indicators.append(SingleIndicator(id: 0, title: "Тест 3", value: "10 000 000", image: UIImage(systemName: "banknote")))
        indicators.append(SingleIndicator(id: 1, title: "Тест 4", value: "20 000 000", image: UIImage(systemName: "bag.badge.plus")))
        indicators.append(SingleIndicator(id: 2, title: "Тест 5", value: "2 000 000", image: nil))
        indicators.append(SingleIndicator(id: 3, title: "Тест 6", value: "", image: nil))
        
        return indicators
    }
}
