//
//  FactsModel.swift
//  Business indicators
//
//  Created by Роман Вертячих on 17.03.2024.
//

import Foundation

#warning("TEST_NetworkLayer")
struct FactsAboutCatsApiResponse {
    let page: Int
    let numberOfResults: Int
    let numberOfPages: Int
    let values: [Fact]
}

struct Fact: Decodable {
    var fact: String
    var length: Int?
}

extension FactsAboutCatsApiResponse: Decodable {
    private enum FactsAboutCatsApiResponseCodingKeys: String, CodingKey {
        case page = "current_page" //текущая страница
        case numberOfResults = "total" //всего записей
        case numberOfPages = "to" //всего страниц
        case facts = "data" //факты
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FactsAboutCatsApiResponseCodingKeys.self)
        
//        let lvl1Container = try decoder.container(keyedBy: lvl1CoodingKeys.self)
//        self.values = try lvl1Container.decode([Fact].self, forKey: .data)
        
        page = try container.decode(Int.self, forKey: .page)
        numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
        numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
        values = try container.decode([Fact].self, forKey: .facts)
        
    }
}
