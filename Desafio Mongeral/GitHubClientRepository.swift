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

class GitHubClientRepository {

    static let END_POINT = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
    
    
    static func getRepositories( completion:@escaping SearchHandler) {
        
        Alamofire.request(END_POINT).responseObject { (response: DataResponse<SearchResultRepository>) in
            completion(response.result.value)
        }
    }
    
    
    static func getPullRequestsRepository(url: URL, completion:@escaping PullRequestHandler) {
        Alamofire.request(url).responseArray { (response: DataResponse<[PullRequestRepository]>) in
            completion(response.result.value)
        }
    }



}
