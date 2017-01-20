//
//  SearchResult.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
import ObjectMapper


class SearchResultRepository: Mappable {
    
    var totalCount: Int?
    var incompleteResults: String?
    var items: [Repository]?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        totalCount <- map["total_count"]
        incompleteResults <- map["incomplete_results"]
        items <- map["items"]
    }
    
}


