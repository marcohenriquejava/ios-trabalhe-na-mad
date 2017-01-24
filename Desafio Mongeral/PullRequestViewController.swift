//
//  PullRequestViewController.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 21/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit


class PullRequestViewController: UITableViewController {
    
    
    let CELL_PULL_REQUEST = "cellPullRequest"
    
    var listPullRequest = [PullRequestViewModel]()
    var resultPullRequest: [PullRequestRepository]?
    var urlPullRequest: String!
    
     var pullRequestList = [PullRequestViewModel]()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.getPullRequest()
        
    }
  
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestList.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pullRequestURL = pullRequestList[indexPath.item].urlPull
        UIApplication.shared.open(URL(string: pullRequestURL)!, options: [:], completionHandler: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_PULL_REQUEST, for: indexPath) as! PullRequestCell
        
        let pull = pullRequestList[indexPath.row]
        cell.fill(with: pull)
        
        return cell
    }
    
    func getPullRequest() {
        GitHubClientRepository.getPullRequestsRepository(url: URL(string: urlPullRequest)!) { (result) in
            guard let resultPull = result else{
                return
            }
            self.resultPullRequest = resultPull
            self.prepareItensViewCell()
        }
    }
    
    
    func prepareItensViewCell() {
        
        guard let resultList = resultPullRequest else {
            AlertFun.ShowAlert(title: "Alerta", message: "Nenhum PullRequest encontrado!", in: self)
            return
        }
        
        for pullReq in resultList {
            self.pullRequestList.append(PullRequestViewModel(pullRequestRepository: pullReq))
        }
        
        self.tableView.reloadData()

    }
    
   
    
}

