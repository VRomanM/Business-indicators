//
//  FactsEndpoint.swift
//  Business indicators
//
//  Created by Роман Вертячих on 15.03.2024.
//

import Foundation

enum NetworkEnvironment {
    case production
}

#warning("TEST_NetworkLayer")

public enum FactsApi {
    case facts(page:Int)
}

extension FactsApi: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://catfact.ninja"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .facts:
            return "facts"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .facts(let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["page":page
                                                      //"api_key": NetworkManager.APIKey
                                                     ])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
