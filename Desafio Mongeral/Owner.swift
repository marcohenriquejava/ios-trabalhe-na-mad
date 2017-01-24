//
//  Owner.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import ObjectMapper



class Owner: Mappable {

    
    var name: String?
    var login: String?
    var avatarUrl: String?
    var url: String?

    required init?(map: Map){}
    
    func mapping(map: Map) {
        name <- map["name"]
        login <- map["login"]
        avatarUrl <- map["avatar_url"]
        url <- map["url"]
    }
    
}


class OwnerViewModel {
    private var owner: Owner
    
    init(owner: Owner) {
        self.owner = owner
    }
    
    var login:String {
        return owner.login ?? ""
    }
    
    var name:String {
        return owner.name ?? ""
    }
    
    var url:URL? {
        return URL(string: owner.url ?? "")
    }
    
    var avatarUrl:String {
        return owner.avatarUrl ?? ""
    }
}
