//
//  UIColor+Extansion.swift
//  Business indicators
//
//  Created by Роман Вертячих on 02.03.2024.
//

import UIKit

extension UIColor {
    
    //MARK: Private function

    func textColor() -> UIColor {
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func textFieldColorText() -> UIColor {
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func backgroundColor() -> UIColor {
        #colorLiteral(red: 0, green: 0.6885375381, blue: 1, alpha: 1)
    }
    
    func selectedTextColor() -> UIColor {
        #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    }
    
    func unselectedTextColor() -> UIColor {
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func buttonColor() -> UIColor {
        #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
}
