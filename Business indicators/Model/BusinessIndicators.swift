//
//  BusinessIndicators.swift
//  Business indicators
//
//  Created by Роман Вертячих on 04.02.2024.
//

import UIKit

protocol Identificatioble {
    var id: Int { get }
}

protocol Descriptible {
    var title: String { get }
    var image: UIImage? { get }
}

class Indicator: Identificatioble, Descriptible {
    
    //MARK: - Properties
    
    let id: Int
    let title: String
    let image: UIImage?
    
    //MARK: - Constructions
    
    init(id: Int, title: String, image: UIImage?) {
        self.id = id
        self.title = title
        self.image = image
    }
    
    //MARK: - Function
    
    static func == (lhs: Indicator, rhs: Indicator) -> Bool {
        lhs.id == rhs.id
    }
    
    static func != (lhs: Indicator, rhs: Indicator) -> Bool {
        lhs.id != rhs.id
    }
}

class SingleIndicator: Indicator {
    
    //MARK: - Properties
    
    var value: String

    //MARK: - Constructions
    
    init(id: Int, title: String, value: String, image: UIImage?) {
        self.value = value
        super.init(id: id, title: title, image: image )
    }
}

class MultiIndicator: Indicator {
    
    //MARK: - Properties
    
    let values: [String]

    //MARK: - Constructions
    
    init(id: Int, title: String, values: [String], image: UIImage?) {
        self.values = values
        super.init(id: id, title: title, image: image)
    }
}
