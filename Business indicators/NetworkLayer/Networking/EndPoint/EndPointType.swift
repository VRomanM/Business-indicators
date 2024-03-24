//
//  EndPointType.swift
//  Business indicators
//
//  Created by Роман Вертячих on 15.03.2024.
//

import Foundation

protocol EndPointType {
    
    //MARK: - Properties
    
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
