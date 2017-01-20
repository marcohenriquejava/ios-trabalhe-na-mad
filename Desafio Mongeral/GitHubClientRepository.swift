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

class GitHubClientRepository {

    static let END_POINT = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
    
    // MARK: - GET Requests
    static func searchRepositories( completion:@escaping SearchHandler) {
        
        Alamofire.request(END_POINT).responseObject { (response: DataResponse<SearchResultRepository>) in
            completion(response.result.value)
        }
    }



}
