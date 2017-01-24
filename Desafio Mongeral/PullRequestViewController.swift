//
//  PullRequestViewController.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 21/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit


class PullRequestViewController: UITableViewController {
    
    
    
    var listPullRequest = [PullRequestViewModel]()
    
    var resultPullRequest: [PullRequestRepository]?
    
    var urlPullRequest: String!
    
     var items = [PullRequestViewModel]()
    
     override func viewDidLoad() {
        super.viewDidLoad()
    
    
        // Do any additional setup after loading the view.
        GitHubClientRepository.getPullRequestsRepository(url: URL(string: self.urlPullRequest)!) { (result) in
            guard let resultPull = result else{
                return
            }
             self.resultPullRequest = resultPull
        }
        
    
    }
    
    
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pullRequestURL = items[indexPath.item].urlPull
        UIApplication.shared.open(URL(string: pullRequestURL)!, options: [:], completionHandler: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPullRequest", for: indexPath) as! PullRequestCell
        
        let pull = items[indexPath.row]
        cell.fill(with: pull)
        
        
        return cell
        
    }
    
    
    func prepareItensViewCell() {
        
        guard let resultList = resultPullRequest else {
            NSLog("Não foi possivel carregar o PullRequest")
            return
        }
        
        for pullReq in resultList {
            self.items.append(PullRequestViewModel(pullRequestRepository: pullReq))
        }
        
        self.tableView.reloadData()

    }
    
   
    
}

