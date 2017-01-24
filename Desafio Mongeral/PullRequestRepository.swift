//
//  PullRequestRepository.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 20/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//


import UIKit
import ObjectMapper


class PullRequestRepository: Mappable {
    
    
    var title: String?
    var body: String?
    var dataCreate: String?
    var urlPull: String?
    
    var owner: Owner?
    
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        urlPull <- map["html_url"]
        dataCreate <- map["created_at"]
        owner <- map["user"]
    }
    
}


class PullRequestViewModel {
    
    private var pullRequestRepository: PullRequestRepository
    
    init(pullRequestRepository: PullRequestRepository) {
        self.pullRequestRepository = pullRequestRepository
    }
    
    var title:String {
        return pullRequestRepository.title ?? ""
    }
    
    var body:String {
        return pullRequestRepository.body ?? ""
    }
    
    var urlPull:String {
        return pullRequestRepository.urlPull ?? ""
    }

    
    /*var dataCreate:Date {
        return CSHelperDate.timestampFormatter.date(from: pullRequestRepository.dataCreate!)!
    }*/
    
    var owner:OwnerViewModel? {
        guard let owner = pullRequestRepository.owner else {
            return nil
        }
        return OwnerViewModel(owner: owner)
    }
    
    
    
}


