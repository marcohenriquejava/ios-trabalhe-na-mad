//
//  Repository.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
import ObjectMapper


class Repository: Mappable {
    
    var nameRepository: String!
    var fullNameRepository: String?
    var descRepository: String!
    var nameAuthor: String!
    var countStars: Int!
    var countForks: Int!
    var pullsUrl: String?
    
    var owner: Owner?
    
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        nameRepository <- map["name"]
        descRepository <- map["description"]
        fullNameRepository <- map["full_name"]
        countStars <- map["stargazers_count"]
        countForks <- map["forks_count"]
        pullsUrl <- map["pulls_url"]
        
        owner <- map["owner"]
    }
    
}


class RepositoryViewModel {
    private var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    var description:String {
        return repository.descRepository ?? ""
    }
    
    var name:String {
        return repository.nameRepository ?? ""
    }
    
    var fullname:String {
        return repository.fullNameRepository ?? ""
    }
    
    var stars:String {
        return repository.countStars?.description ?? "0"
    }
    
    var forks:String {
        return repository.countForks?.description ?? "0"
    }
    
    var pullsUrlString:String? {
        return repository.pullsUrl?.replacingOccurrences(of: "{/number}", with: "") ?? ""
    }
    
    var owner:OwnerViewModel? {
        guard let owner = repository.owner else {
            return nil
        }
        return OwnerViewModel(owner: owner)
    }
}
