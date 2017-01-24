//
//  GitHubClient.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias SearchHandler = (_ result:SearchResultRepository?) -> Void

typealias PullRequestHandler = (_ result:[PullRequestRepository]?) -> Void

typealias OwnerHandler = (_ result:Owner?) -> Void

class GitHubClientRepository {

    static let END_POINT = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
    
    
    static func getRepositories(page:Int, completion:@escaping SearchHandler) {
        
        let searchURL = "\(END_POINT)&page=\(page)"
        
        Alamofire.request(searchURL).responseObject { (response: DataResponse<SearchResultRepository>) in
            completion(response.result.value)
        }
    }
    
    
    static func getPullRequestsRepository(url: URL, completion:@escaping PullRequestHandler) {
        Alamofire.request(url).responseArray { (response: DataResponse<[PullRequestRepository]>) in
            completion(response.result.value)
        }
    }
    
    
    static func getOwner(url: URL, completion:@escaping OwnerHandler) {
        Alamofire.request(url).responseObject { (response: DataResponse<Owner>) in
            completion(response.result.value)
        }
    }



}
