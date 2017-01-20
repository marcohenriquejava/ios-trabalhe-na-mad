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



class RepositoryObjectModel {
    private var repo: Repository
    
    init(repository: Repository) {
        self.repo = repository
    }
    
    
    var description:String {
        return repo.descRepository ?? ""
    }
    
    var name:String {
        return repo.nameRepository ?? ""
    }
    
    var fullname:String {
        return repo.fullNameRepository ?? ""
    }
    
    var stars:String {
        return repo.countStars?.description ?? "0"
    }
    
    var forks:String {
        return repo.countForks?.description ?? "0"
    }
    
    var pullsURLString:String? {
        return repo.pullsUrl?.replacingOccurrences(of: "{/number}", with: "") ?? ""
    }
    
    var owner:OwnerObjectModel? {
        guard let owner = repo.owner else {
            return nil
        }
        return OwnerObjectModel(owner: owner)
    }
}
